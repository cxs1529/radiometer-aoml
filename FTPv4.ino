
// libraries
#include <MKRGSM.h>
#include <GSMFTP.h> //** library created by https://github.com/tryhus/MKRGSM/tree/feature/ftp
#include <GSMFileSystem.h>
#include "arduino_secrets.h"
#include <RTCZero.h> //** download this library from the library manager
//** Check changes in libraries GSM.cpp and endian.h

// Please enter your sensitive data in the Secret tab or arduino_secrets.h
// PIN Number
const char PINNUMBER[] = SECRET_PINNUMBER;
// APN data
const char GPRS_APN[] = SECRET_GPRS_APN;
const char GPRS_LOGIN[] = SECRET_GPRS_LOGIN;
const char GPRS_PASSWORD[] = SECRET_GPRS_PASSWORD;

// ** functions
bool StreamOut();
bool test();
byte enterVal();
String print2digits();
String TimeValue();
String ceros();
String getfileName();

int fileTime; //** global variable for use in Setup and Loop with pointer. Will contain sampling time per txt file
int *pfileTime;

// initialize the library instance
GSMFTP ftp;
GPRS gprs;
GSM gsmAccess;
RTCZero rtc;

// ** ----------------------------------------------------------------------------------------------------------------------------------------
// ** (1)SETUP FUNCTION - START

void setup() {

  // initialize serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // ** wait for serial port to connect. Helps avoid skipping next serial lines.
  }
  Serial.setTimeout(100); // ** sets the maximum milliseconds to wait for serial data

  Serial.println("\n-------------------------------------------------------------------");
  Serial.println("Serial connection started\n");
  //Serial.println("");

  Serial.println("** 60 - 1 file per minute / 300 - 1 file every 5 minutes");
  Serial.println("** 900 - 1 file every 15 minutes / 1800 - 1 file every 30 minutes");
  Serial.println("** 3600 - 1 file every 1 hour");
  Serial.print("Please enter the sampling time per .txt file [seconds]: ");
  while ( Serial.available() == 0 ) {
    ;  // wait until serial is sent
  }
  int fileTime = Serial.parseInt();
  byte garbage1 = Serial.parseInt(); // grabs the \n
  Serial.println( String(fileTime) + " seconds");
  Serial.println("A file will be generated and uploaded to " + String(SECRET_FTP_HOST) + " every " + String(fileTime / 60) + " minutes\n");

  *pfileTime = fileTime;
  pfileTime = &fileTime;



  // ** (2)ENTER DATE AND TIME - START
  Serial.println("Set time for RTC...\n");
enterAgain:
  byte d = 100, mo = 100, y = 100, h = 100, m = 100, s = 100;
  while ( d > 31 ) {
    Serial.print("Enter day DD: ");
    d = enterVal();
  }
  while ( mo > 12 ) {
    Serial.print("Enter Month MM: ");
    mo = enterVal();
  }
  while ( y > 99 ) {
    Serial.print("Enter Year YY: ");
    y = enterVal();
  }
  while ( h > 24 ) {
    Serial.print("Enter hour hh: ");
    h = enterVal();
  }
  while ( m > 59 ) {
    Serial.print("Enter minute mm: ");
    m = enterVal();
  }
  while ( s > 59 ) {
    Serial.print("Enter second ss: ");
    s = enterVal();
  }

  Serial.println("Date and time entered: " + print2digits(mo) + "/" + print2digits(d) + "/" + print2digits(y) + " " + print2digits(h) + ":" + print2digits(m) + ":" + print2digits(s));
select:

  Serial.println("");
  Serial.print("Continue [Enter] / re-enter [r]: ");
  while ( Serial.available() == 0 ) {
    ;  //** wait until serial is sent
  }

  char k = Serial.read();
  Serial.println(k);
  char garbage = Serial.read(); //** grabs the last char remaining "/n" from new line to avoid input in next variable
  switch (k) {
    case '\n':
      break;

    case 'u':
      goto enterAgain;
      break;

    default:
      Serial.println("Incorrect key\n");
      goto select; // ** jump back to "select" label
      break;
  }
  Serial.println("During the process type 'stop' to finish the uploading process\n" );

  rtc.begin(); // initialize RTC
  rtc.setTime(h, m, s); // (hours, minutes, seconds)
  rtc.setDate(d, mo, y); //(day, month, year)

  // ** (2)ENTER DATE AND TIME - END


  // ** (3)INITIALIZE GSM AND CONNECT TO NETWORK - START
  Serial.println("Starting Arduino FTP client...");
  // connection state
  bool connected = false;

  // After starting the modem with GSM.begin()
  // attach the shield to the GPRS network with the APN, login and password
  while (!connected) {
    if ((gsmAccess.begin(PINNUMBER) == GSM_READY) &&
        (gprs.attachGPRS(GPRS_APN, GPRS_LOGIN, GPRS_PASSWORD) == GPRS_READY)) {
      connected = true;
      Serial.println("Connected to GSM Network");
    }
    else {
      Serial.println("Not connected");

    }
  }
  // ** (3)INITIALIZE GSM AND CONNECT TO NETWORK - END

}

// ** (1)SETUP FUNCTION - END
// ** ----------------------------------------------------------------------------------------------------------------------------------------
// ** (4)LOOP FUNCTION - START

void loop() {
  GSMFileSystemElem localFile;
  GSMFTPElem remoteFile;
  int fileTimeSetup = *pfileTime; // bring time per file from Setup() to Loop() by reference

  // ** FOR LOOP -P- START
  for ( int p = 0; p < 5; p++ ) { // only for test, repeat -p- files only. Replace 'p<5' by 'true' for infinite loop

    test("Connect to FTP server", ftp.connect(SECRET_FTP_HOST, SECRET_FTP_USER, SECRET_FTP_PASSWORD, SECRET_FTP_PORT));

    test("Change current remote directory to " + String(SECRET_FTP_REMOTE_DIR) ,ftp.cd(SECRET_FTP_REMOTE_DIR)); //** if is not found root directory will be used


    //--- Test Stream data ---

    String fileName = getfileName(fileTimeSetup); // ** file name MMDDYYhh or MMDDYYhhmm if tileTime < 3600
    test("Stream data to server", StreamOut(fileName, fileTimeSetup ));

    test("Disconnect to FTP server", ftp.disconnect());

    if (Serial.available() != 0) {
      String command = Serial.readString();
      if ( command == "stop\n") { // skip the next - p - iterations and go to finish label
        p = 5;
        Serial.println("\nStop pressed\n");
      }
    }

  }
  // ** FOR LOOP -P- END

  Serial.println("\nFile uploading finished");
  for (;;)
    ; // infinite loop to stop uploading and sampling -

}

// ** (4)LOOP FUNCTION - END
// ** ----------------------------------------------------------------------------------------------------------------------------------------

// ** (5) FUNCTIONS FOR DATA STREAMING - UPLOAD - START
bool StreamOut(const String& remoteFileName, int totalTime)
{
  int res = 0;

  //Start upload
  Serial.println("Uploading file...");
  if (ftp.streamOutStart(remoteFileName) == false) {
    return false;
  }

  //send data by packets

  int t0out = millis();
  for (int i = 0; i < totalTime; i++) {

    int t0 = millis();
    String data = TimeValue(); // get data in format MMDDYYhhmmssAAAABBBB 20 digits
    int dataLen = data.length();
    //Serial.println(data + " String length " + String(dataLen) );

    char a[dataLen + 1] ; // define the char array used to send data with ftp.streamout
    data.toCharArray( a, dataLen + 1 ); // convert data string to char array and stores it in "a" and length 22
    int k = strlen(a);
    //Serial.println(String(a) + " char array length " + String(k) );

    ftp.streamOut( a, k ); // ** Fotmat is ( String, String length )--> string includes "\n" and "\0" for string NULL termination

    // ** Print % of file uploading every 'uu' lines
    int uu = i % (totalTime / 10);
    if ( (uu == 0) & (i > (totalTime / 10) - 1)) {

      int progress = round(float(i) * 100 / float(totalTime)); // progress in %
      Serial.print("..." + String(progress) + "%");
    }

    if ( i == totalTime - 1 ) {
      Serial.println("...100 % Done!");
    }

    int tf = millis();
    delay(1000 - (tf - t0)); // adjusts the time to print one sample per second
  }

  int tfout = millis();
  Serial.println(String(tfout - t0out) + " ms upload time");  // ** check if the total time corresponds to the number of iterations "i"


  while (res == 0) {
    res = ftp.streamOutReady();
    //do something
  }

  return (res == 1);
}
// ** (5) FUNCTIONS FOR DATA STREAMING - UPLOAD - END

// ** (6) "TEST" FUNCTION DEFINITION - START
bool test(const String& msg, bool function)
{
  if (function == true) {
    Serial.print("OK - ");
  }
  else {
    Serial.print("ERROR - ");
  }
  Serial.println(msg);

  return function;
}
// ** (6) "TEST" FUNCTION DEFINITION - END

// ** (7) DATE AND TIME - START
// ** (7.1) Enter Date and Time - Start
byte enterVal() {
  while ( Serial.available() == 0 ) {
    ; // wait until serial is sent
  }
  byte x = Serial.parseInt();

  Serial.println(x);
  byte garbage = Serial.parseInt(); // grabs the last char remaining "/n" from new line to avoid input in next variable
  return x;
}
// ** (7.1) Enter Date and Time - End

// ** (7.2) Date and Time format - Start
String print2digits(byte number) {
  String n = "";
  if (number < 10) {
    n = "0" + String(number); // ** If number is < 10, add a character '0' before
  } else {
    n = String(number);
  }
  return n;
}
// ** (7.2) Date and Time format - End
// ** (7) DATE AND TIME - END

// ** (8) STRING DATE TIME VALUE - START
String TimeValue() {

  // ** (8.1) Get Date and time from RTC
  String day = print2digits(rtc.getDay());
  String month = print2digits(rtc.getMonth());
  String year = print2digits(rtc.getYear());
  String hour = print2digits(rtc.getHours());
  String minute = print2digits(rtc.getMinutes());
  String second = print2digits(rtc.getSeconds());

  // ** (8.2) Get analog values in 4 digit format
  // ** Value 1
  String pot1 = String(analogRead(A1));
  int potLen1 = pot1.length();
  String pot4d1 = ceros(potLen1) + pot1; // ** analog value in 4 digit format
  // ** Value 2
  String pot2 = String(analogRead(A1));
  int potLen2 = pot2.length();
  String pot4d2 = ceros(potLen2) + pot2; // ** analog value in 4 digit format

  String dataString = month + day + year + hour + minute + second + pot4d1 + pot4d2 + "\n"; // add cariage return at the end
  //Serial.println(dataString + " dataString from function");

  return dataString;
}
// ** (8) STRING DATE TIME VALUE - END

// ** (9) ANALOG VALUES IN 4 DIGIT FORMAT - START
String ceros (int g) { // g is the length of the analog value as a String
  switch (g) {
    case 1:
      return "000";
      break;
    case 2:
      return "00";
      break;
    case 3:
      return "0";
      break;
    case 4:
      return "";
      break;
  }
}
// ** (9) ANALOG VALUES IN 4 DIGIT FORMAT - END

// ** (10) CREATE FILE NAME - START
String getfileName(int g) {
  String fname;
  if ( g > 3599 ) {
    fname = print2digits(rtc.getMonth()) + print2digits(rtc.getDay()) + print2digits(rtc.getYear()) + print2digits(rtc.getHours()) + ".txt";
  } else {
    fname = print2digits(rtc.getMonth()) + print2digits(rtc.getDay()) + print2digits(rtc.getYear()) + print2digits(rtc.getHours()) + print2digits(rtc.getMinutes()) + ".txt";
  }

  return fname;
}
// ** (10) CREATE FILE NAME - END
