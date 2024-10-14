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


int value = 0; // raw analog value
bool state = 0; // switch state
double val = 0.0;
double irrad = 0.0;
double DtA = 5.0/1024.0;
double rem_Gain = (1.0/500.00);
double irrScale = (1000000.0/8.26);



 struct sensorStats
 {
  float MAX = 0.0;
  float MIN = 0.0;
  float AVG = 0.0;
  float INST = 0.0;
  
  String MaxString = "0.0";
  String MinString = "0.0";
  String AveString = "0.0";
  String InstString = "0.0";

 } irradS;
 
      
const int chipSelect = 10; // Enable SD board with pin 10 arduino or 16 chip atmega


struct TimeInfo
{
  float t_dif = 0.0;
  int j = 0;

  String t_difString = String("0.0");
  String jString = String("0");
  
  String MonthString = "";
  String DayString = "";
  String YearString = "";
  String HourString = "";
  String MinuteString = "";
  String SecondString = "";
} DateLog;



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
  state = digitalRead(sw1); //Switch between AVERAGE and INSTANT mode - SW1 uses the built-in pullup resistor  
  // HIGH||LOW <-> Averaging||Instant
  while(state) // for AVERAGING LOOP
  { 
    digitalWrite(led,HIGH);

    //START Test SD card
    checkSDCard();
    //END Test SD card
  
    // START MAIN LOOP
    for(int j = 0; state ; j++)
    {
      DateLog.j = j+1;
      if( j == 0)
        openSDCard_HL();

      if ( j== 3600) 
        j=0; // Once log number reaches 3600 (after 1h), start over. This is to avoid very large numbers

      float t_start = millis(); // check sampling time START


      // START Sampling
      // ---------------------------------------------------------
 
      int AVG = 0;
      double SUM = 0;
      int BATCH[n] = {0};
      int MIN = 2000; // Minimum value of the batch
      int MAX = 0; // Maximum value of the batch
      int INST = 0; // First value or instant value for the 15 min sample period
      String dataString = ""; // String to write in SD card -------NOT USED- DUGAZ
    
      state = digitalRead(sw1); //Switch between AVERAGE and INSTANT mode
    
      // average "n" samples of voltage reading and gets Min, Max, and instant value
      for(int i = 0; (i < n)&&(state); i++)
      {
        BATCH[i] = analogRead(potV);

        delay(t_sample); 
            
        SUM = BATCH[i] + SUM; // sum the n values to later average    

        // START - MIN value
        MIN = batchMin(BATCH[i], MIN);
        // END - MIN value

        // START - MAX value
        MAX = batchMin(BATCH[i], MAX);       
        // END - MAX value
    
        INST = BATCH[0]; // Instant value is the first sample of the batch
   

        //Start Date and time function
        // ---------------------------------------------------------
        tmElements_t tm;

        if ( i == 0 ) 
        {
          // Save date and time only at the beginning

    
          RTC.read(tm); // Read time funcion
    
          //Conversion of date and time to string
          DateLog.MonthString = String(tm.Month);
          DateLog.DayString = String(tm.Day);
          DateLog.YearString = String(tmYearToCalendar(tm.Year));

          if ( (tm.Hour >= 0)&&(tm.Hour < 10)){ DateLog.HourString = "0" + String(tm.Hour); } else { DateLog.HourString = String(tm.Hour); }
          if ( (tm.Minute >= 0)&&(tm.Minute < 10)){ DateLog.MinuteString = "0" + String(tm.Minute); } else { DateLog.MinuteString = String(tm.Minute); }
          if ( (tm.Second >= 0)&&(tm.Second < 10)){ DateLog.SecondString = "0" + String(tm.Second); } else { DateLog.SecondString = String(tm.Second); }
        }
        // ---------------------------------------------------------
        //End Date and time function

        state=digitalRead(sw1); // check if switch is still in Average mode
    
      }

      AVG = round(SUM/n); // average of n values

      state=digitalRead(sw1); // check if switch is still in Average mode

      // END Sampling

      // Conversion of values to W/m2
      irradS.MAX = MAX*DtA*rem_Gain*irrScale;
      irradS.MIN = MIN*DtA*rem_Gain*irrScale;
      irradS.AVG = AVG*DtA*rem_Gain*irrScale;
      irradS.INST = INST*DtA*rem_Gain*irrScale;
  
      float t_end = millis(); // check sampling time END
      DateLog.t_dif = (t_end - t_start)/1000.0 ; // Total sampling time in seconds
  
      //Conversion of values to string format  
      irradS.MaxString = String(irradS.MAX);
      irradS.MinString = String(irradS.MIN);
      irradS.AveString = String(irradS.AVG);
      irradS.InstString = String(irradS.INST);
      //String nString = String(n);
      DateLog.t_difString = String(DateLog.t_dif);
      DateLog.jString = String(DateLog.j);
      
      //dataString =""; // initialize string
      //Save string with concatenated values 
      //dataString = MonthString +"/"+ DayString +"/"+ YearString +" "+ HourString +":"+ MinuteString +":"+ SecondString + ", " + jString + ", " + nString + ", " + t_difString + ", " + irrad_MaxString + ", " + irrad_MinString + ", " + irrad_AveString + ", " + irrad_InstString + '\0'   ;
      
      //Open SD file on SD card
      openSDCard_Data(DateLog, irradS);
    
      state=digitalRead(sw1); // check if switch is still in Average mode
    }

    state=digitalRead(sw1); // check if switch is still in Average mode

   

  } // END AVERAGE MAIN LOOP

    
  
  // Instant Value Mode  

  while(!state)
  { 

    digitalWrite(led,LOW); // Turn led off if not in average mode  

    // START Instant value counter
    for( int k=0 ; !state ; k++)
    {  
  
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

void checkSDCard()
{
  Serial.println("");
  Serial.print("Initializing SD card...");

  if (!SD.begin(chipSelect))
  {
    Serial.println("Card failed, or not present");
    while(1);//urgghhh //exit(0); //return;
  }

  Serial.println("Card initalized!");
}

void openSDCard_HL()
{
  // START if - Write headline in SD card only at the beginning of average sampling mode

  //String with headline
  //dataString1 = "MM/DD/YYYY hh:mm:ss, Log number, Samples, Time sampled [seconds], MAX [W/m2], MIN [W/m2], AVERAGE [W/m2], INSTANT [W/m2]";

  //Open SD file on SD card
  File dataFile = SD.open("datalog.txt", FILE_WRITE);
  // if the file is available, write to it:
  if (dataFile)
  {
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

void openSDCard_Data(TimeInfo& DateLog, sensorStats& irradS)
{
  File dataFile = SD.open("datalog.txt", FILE_WRITE);
  // if the file is available, write to it:
  if (dataFile) 
  {
    dataFile.print(DateLog.MonthString); dataFile.print("/"); dataFile.print(DateLog.DayString); dataFile.print("/"); dataFile.print(DateLog.YearString); dataFile.print(", ");
    dataFile.print(DateLog.HourString); dataFile.print(":"); dataFile.print(DateLog.MinuteString); dataFile.print(":"); dataFile.print(DateLog.SecondString); dataFile.print(", ");
  
    dataFile.print(DateLog.jString); dataFile.print(", "); dataFile.print(DateLog.t_difString); dataFile.print(", ");
  
    dataFile.print(irradS.MaxString); dataFile.print(", "); dataFile.print(irradS.MinString); dataFile.print(", "); 
    dataFile.print(irradS.AveString); dataFile.print(", "); dataFile.print(irradS.InstString); dataFile.println("");
  
    dataFile.close();
  
    //Print in Serial COM 
    Serial.print(DateLog.MonthString); Serial.print("/"); Serial.print(DateLog.DayString); Serial.print("/"); Serial.print(DateLog.YearString); Serial.print(" ");
    Serial.print(DateLog.HourString); Serial.print(":"); Serial.print(DateLog.MinuteString); Serial.print(":"); Serial.print(DateLog.SecondString); Serial.print(", ");
    Serial.print(DateLog.j); Serial.print(", ");
    Serial.print(DateLog.t_dif,1); Serial.print(", ");
    Serial.print(irradS.MAX,1); Serial.print(", ");
    Serial.print(irradS.MIN,1); Serial.print(", ");
    Serial.print(irradS.AVG,1); Serial.print(", ");
    Serial.println(irradS.INST,1);
  }
  // if the file isn't open, pop up an error:
  else
    Serial.println("error opening datalog.txt");
}




int batchMin(int data, int minimum)
{
  if ( data < minimum)
    minimum = data;

  return minimum;
}

int batchMax(int data, int maximum)
{
  if (data > maximum)
    maximum = data;        

  return maximum;
}


// function prototypes for gain adjustment here
float gain_adjust(float& aVAL, int alpha, int beta) //... 
