/*
Radiometer DAC Reader V5.0

STATUS: Stable

For use with Eppley PSP radiometer

Equipment:
Arduino UNO
    R1, R2, R3,
    Pot1, Pot2, Pot3
    SW1
    LCD Display
    
2.5-5VDC supply
USEA Single-Ended Sensor Amplifier (Dual Op Amp Package) 
    Av = 500
    SW1: 0000
    SW2: 0111


Primary Author: Christian Saiz
Secondary/Revisor: Diego Ugaz

*/

// SD card board libraries
#include <SPI.h>
#include <SD.h>

// RTC libraries
#include <Wire.h>
#include <TimeLib.h>
#include <DS1307RTC.h>


#define potV A0
#define sw1 8
#define led 7


int const n = 10; // Number of samples to average - 10*100ms = 1 sec
int t_sample = 100; // time between samples within average function in SECONDS


//for non-linear gain compensation
float analog_Max = 0.0;
float analog_Min = 0.0;float analog_Ave = 0.0;
float analog_Inst = 0.0;

int value = 0; // raw analog value
bool state = 0; // switch state
double val = 0.0;
double irrad = 0.0;
double DtA = 5.0/1024.0;
double rem_Gain = (1.0/500.00);
double irrScale = (1000000.0/8.26);

float irrad_Max = 0.0;
float irrad_Min = 0.0;
float irrad_Ave = 0.0;
float irrad_Inst = 0.0;

//constants for non-linear models of Amplifier output
const float alpha1 = 0.3380; // constant coefficient of exponential model 1
const float Beta1 = 1.8839; //from 1/0.5308; exponent constant
const float alpha2 = 0.3643; // constant coefficient of exponential model 2
const float Beta2 = 1.1125; //from 1./0.8989; exponent constant

const int chipSelect = 10; // Enable SD board with pin 10 arduino or 16 chip atmega


String MonthString = "";
String DayString = "";
String YearString = "";
String HourString = "";
String MinuteString = "";
String SecondString = "";

// -----------------------------------------------------------------------------------------------------------------------

void setup() 
{
  Serial.begin(9600); 
  
  pinMode(potV,INPUT); // analog input value for voltage reading
  pinMode(led,OUTPUT); // led witness for average measures
  digitalWrite(led,LOW);


  pinMode(sw1,INPUT_PULLUP); // switch 1
  state = 0; // Start with instant values  

  //setTime(14,15,0,4,2,2020); // set time when needed (h,m,s,dd,mm,yyyy)--> delete slashes to set new time and date
  //RTC.set(now()); // set time when needed --> delete slashes idem
  
  
}

// -----------------------------------------------------------------------------------------------------------------------

void loop() 
{

  // INSTANT/AVERAGE Measurement Modes
  state = digitalRead(sw1); //Switch between AVERAGE and INSTANT mode - SW1 uses the built in pullup resistor, so HIGH means no input and LOW connected to ground
  
  // HIGH||LOW <-> Averaging||Instant
  while(state)
  { 

  digitalWrite(led,HIGH);

  //START Test SD card
  Serial.println("");
  Serial.print("Initializing SD card...");

  // see if the card is present and can be initialized:
  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    // don't do anything more:
    while (1);
  }
  Serial.println("card initialized.");
  //END Test SD card
  
  // START MAIN LOOP
  for(int j = 0; state ; j++){

 
  
  if( j == 0){ // START if - Write headline in SD card only at the beginning of average sampling mode
    
  //String with headline
  //dataString1 = "MM/DD/YYYY hh:mm:ss, Log number, Samples, Time sampled [seconds], MAX [W/m2], MIN [W/m2], AVERAGE [W/m2], INSTANT [W/m2]";
 
  //Open SD file on SD card
  File dataFile = SD.open("datalog.txt", FILE_WRITE);
  // if the file is available, write to it:
  if (dataFile) {
    dataFile.println("");
    dataFile.println("--------------------------------------------------------------------------------------------------------");
    dataFile.print("Samples to average: "); dataFile.print(n); dataFile.print(", Time between samples [milliseconds]: "); dataFile.println(t_sample);
    dataFile.println("");
    dataFile.println("MM/DD/YYYY hh:mm:ss, Log N, Time sampled [seconds], MAX [W/m2], MIN [W/m2], AVERAGE [W/m2], INSTANT [W/m2]");
    dataFile.close();
    // print to the serial port too:
    Serial.println("");
    Serial.println("--------------------------------------------------------------------------------------------------------");
    Serial.print("Samples to average: "); Serial.print(n); Serial.print(", Time between samples [milliseconds]: "); Serial.println(t_sample);
    Serial.println("");
    Serial.println("MM/DD/YYYY hh:mm:ss, Log N, Time sampled [seconds], MAX [W/m2], MIN [W/m2], AVERAGE [W/m2], INSTANT [W/m2]");
  }
  // if the file isn't open, pop up an error:
  else 
  {
    Serial.println("error opening datalog.txt");
  }
  } 
  // END if - headline  

  if ( j== 3600) { j=0; } // Once log number reaches 3600 (after 1h), start over. This is to avoid very large numbers

    float t_start = millis(); // check sampling time START


// START Sampling
// ---------------------------------------------------------
 
  int AVG = 0;
  double SUM = 0;
  int BATCH[n] = {0};
  int MIN = 2000; // Minimum value of the batch
  int MAX = 0; // Maximum value of the batch
  int INST = 0; // First value or instant value for the 15 min sample period
  String dataString = ""; // String to write in SD card

  state = digitalRead(sw1); //Switch between AVERAGE and INSTANT mode

  // average "n" samples of voltage reading and gets Min, Max, and instant value
  for(int i = 0; (i < n)&&(state); i++)
  {
    BATCH[i] = analogRead(potV);

    delay(t_sample);
    
    SUM = BATCH[i] + SUM; // sum the n values to later average    


  // START - MIN value
          
      if ( BATCH[i] < MIN)
      {
        MIN = BATCH[i];        
      }            
    
   // END - MIN value
   

  // START - MAX value
  
    if ( BATCH[i] > MAX)
      {
        MAX = BATCH[i];        
      }             
    
   // END - MAX value
   
   INST = BATCH[0]; // Instant value is the first sample of the batch
   

   //Start Date and time function
// ---------------------------------------------------------
  tmElements_t tm;

  if ( i == 0 ) { // Save date and time only at the beginning

    
  RTC.read(tm); // Read time funcion
    
  //Conversion of date and time to string
  MonthString = String(tm.Month);
  DayString = String(tm.Day);
  YearString = String(tmYearToCalendar(tm.Year));

  if ( (tm.Hour >= 0)&&(tm.Hour < 10)){ HourString = "0" + String(tm.Hour); } else { HourString = String(tm.Hour); }
  if ( (tm.Minute >= 0)&&(tm.Minute < 10)){ MinuteString = "0" + String(tm.Minute); } else { MinuteString = String(tm.Minute); }
  if ( (tm.Second >= 0)&&(tm.Second < 10)){ SecondString = "0" + String(tm.Second); } else { SecondString = String(tm.Second); }
     
    
  }
// ---------------------------------------------------------
//End Date and time function

  state=digitalRead(sw1); // check if switch is still in Average mode
    
  }

  AVG = round(SUM/n); // average of n values

  state=digitalRead(sw1); // check if switch is still in Average mode

// END Sampling

    // Conversion of values to W/m2
    // Adjusted for applying gain correction from non-linear amplifier gain response
    analog_Max = MAX*DtA;
    if(analog_Max<0.4)
    {
      analog_Max = pow((analog_Max/alpha1),Beta1);//root -0.469 of analog_Max/337.95
      irrad_Max = analog_Max*irrScale;
    }
    else if((analog_Max>=0.4)&&(analog_Max<1.8))
    {
      analog_Max = pow((analog_Max/alpha1),Beta1);//root -0.101 of analog_Max/364.29  
      irrad_Max = analog_Max*irrScale;
    }
    else
      irrad_Max = analog_Max*rem_Gain*irrScale;


    analog_Min = MIN*DtA;
    if(analog_Min<0.4)
    {
      analog_Min = pow((analog_Max/alpha1),Beta1);//root -0.469 of analog_Min/337.95
      irrad_Min = analog_Min*irrScale;
    }
    else if((analog_Min>=0.4)&&(analog_Min<1.8))
    {
      analog_Min = pow((analog_Max/alpha2),Beta2);//root -0.101 of analog_Min/364.29  
      irrad_Min = analog_Min*irrScale;
    }
    else
      irrad_Min = analog_Min*rem_Gain*irrScale;
    
    analog_Ave = AVG*DtA;
    if(analog_Ave<0.4)
    {
      analog_Ave = pow((analog_Max/alpha1),Beta1);//root -0.469 of analog_Ave/337.95
      irrad_Ave = analog_Ave*irrScale;
    }
    else if((analog_Ave>=0.4)&&(analog_Ave<1.8))
    {
      analog_Ave = pow((analog_Max/alpha2),Beta2);//root -0.101 of analog_Ave/364.29  
      irrad_Ave = analog_Ave*irrScale;
    }
    else
      irrad_Ave = analog_Ave*rem_Gain*irrScale;
    
    analog_Inst = INST*DtA;
    if(analog_Inst<0.4)
    {
      analog_Inst = pow((analog_Max/alpha1),Beta1);//root -0.469 of analog_Inst/337.95
      irrad_Inst = analog_Inst*irrScale;
    }
    else if((analog_Inst>=0.4)&&(analog_Inst<1.8))
    {
      analog_Inst = pow((analog_Max/alpha2),Beta2);//root -0.101 of analog_Inst/364.29  
      irrad_Inst = analog_Inst*irrScale;
    }
    else
      irrad_Inst = analog_Inst*rem_Gain*irrScale;

    float t_end = millis(); // check sampling time END
    float t_dif = (t_end - t_start)/1000.0 ; // Total sampling time in seconds
  
  //Conversion of values to string format  
  String irrad_MaxString = String(irrad_Max);
  String irrad_MinString = String(irrad_Min);
  String irrad_AveString = String(irrad_Ave);
  String irrad_InstString = String(irrad_Inst);
  //String nString = String(n);
  String t_difString = String(t_dif);
  String jString = String(j+1);
  
  //dataString =""; // initialize string
  //Save string with concatenated values 
  //dataString = MonthString +"/"+ DayString +"/"+ YearString +" "+ HourString +":"+ MinuteString +":"+ SecondString + ", " + jString + ", " + nString + ", " + t_difString + ", " + irrad_MaxString + ", " + irrad_MinString + ", " + irrad_AveString + ", " + irrad_InstString + '\0'   ;
  
  //Open SD file on SD card
  File dataFile = SD.open("datalog.txt", FILE_WRITE);
  // if the file is available, write to it:
  if (dataFile) {
    dataFile.print(MonthString); dataFile.print("/"); dataFile.print(DayString); dataFile.print("/"); dataFile.print(YearString); dataFile.print(", ");
    dataFile.print(HourString); dataFile.print(":"); dataFile.print(MinuteString); dataFile.print(":"); dataFile.print(SecondString); dataFile.print(", ");
    
    dataFile.print(jString); dataFile.print(", "); dataFile.print(t_difString); dataFile.print(", ");

    dataFile.print(irrad_MaxString); dataFile.print(", "); dataFile.print(irrad_MinString); dataFile.print(", "); 
    dataFile.print(irrad_AveString); dataFile.print(", "); dataFile.print(irrad_InstString); dataFile.println("");
    
    
    dataFile.close();
    
    //Print in Serial COM 
    Serial.print(MonthString); Serial.print("/"); Serial.print(DayString); Serial.print("/"); Serial.print(YearString); Serial.print(" ");
    Serial.print(HourString); Serial.print(":"); Serial.print(MinuteString); Serial.print(":"); Serial.print(SecondString); Serial.print(", ");
    Serial.print(j+1); Serial.print(", ");
    Serial.print(t_dif,1); Serial.print(", ");
    Serial.print(irrad_Max,1); Serial.print(", ");
    Serial.print(irrad_Min,1); Serial.print(", ");
    Serial.print(irrad_Ave,1); Serial.print(", ");
    Serial.println(irrad_Inst,1);
  }
  // if the file isn't open, pop up an error:
  else {
    Serial.println("error opening datalog.txt");
  }
    
   
    
    
   state=digitalRead(sw1); // check if switch is still in Average mode
 }

   state=digitalRead(sw1); // check if switch is still in Average mode

   

  } // END AVERAGE MAIN LOOP

    
  
  // Instant Value Mode  

  while(!state)
  { 

  digitalWrite(led,LOW); // Turn led off if not in average mode  

  // START Instant value counter
  for( int k=0 ; !state ; k++){  
  
  if( k == 0) // Print change of mode only at the beginning
  {

  Serial.println(""); Serial.println(""); Serial.println("");  
  Serial.println("Instant value mode - Not logging data");
  Serial.println(""); Serial.println(""); 
  }
  
  Serial.print("Instant Value= ");

  irrad = 0;
    
  value = analogRead(potV); // read analog input in pot (A5) (0-1023)
  irrad = value*DtA*rem_Gain*irrScale; //Scale out to W/m2

  Serial.print(irrad);
  Serial.println(" W/m2");
  

  delay(1000);
  state=digitalRead(sw1); // check if switch is still in Instant mode

  } // END Instant value counter 
  }  // END while
 
}
