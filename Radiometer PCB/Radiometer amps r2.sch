EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 6750 2850 2    51   ~ 0
A2 Arduino\n
Text Notes 6850 1800 2    51   ~ 0
A1 Arduino\n
$Comp
L power:GND #PWR021
U 1 1 5FDB46B5
P 9400 4050
F 0 "#PWR021" H 9400 3800 50  0001 C CNN
F 1 "GND" H 9405 3877 50  0000 C CNN
F 2 "" H 9400 4050 50  0001 C CNN
F 3 "" H 9400 4050 50  0001 C CNN
	1    9400 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5FDABEB4
P 4850 4600
F 0 "#PWR019" H 4850 4350 50  0001 C CNN
F 1 "GND" H 4855 4427 50  0000 C CNN
F 2 "" H 4850 4600 50  0001 C CNN
F 3 "" H 4850 4600 50  0001 C CNN
	1    4850 4600
	1    0    0    -1  
$EndComp
Text GLabel 6150 4300 2    47   Input ~ 0
Vcc
Text Notes 6650 4350 2    50   ~ 0
Buffer\n3.3V\n
Text Notes 5100 4150 2    50   ~ 0
Buffer\n1.65V\n
Text Notes 3850 4200 2    50   ~ 0
Precision Vref\n3.3V\n
Text Notes 7300 4600 2    51   ~ 0
Vref 3.3V\nArduino
Wire Wire Line
	3800 4300 4250 4300
Wire Wire Line
	5700 3200 5700 3800
Connection ~ 4600 3200
Wire Wire Line
	4600 3800 4600 3200
Connection ~ 3800 4500
$Comp
L power:GND #PWR09
U 1 1 5FD3F2C1
P 3800 4700
F 0 "#PWR09" H 3800 4450 50  0001 C CNN
F 1 "GND" H 3805 4527 50  0000 C CNN
F 2 "" H 3800 4700 50  0001 C CNN
F 3 "" H 3800 4700 50  0001 C CNN
	1    3800 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US Rd2
U 1 1 5FD3D5F5
P 3800 4600
F 0 "Rd2" H 3868 4646 50  0000 L CNN
F 1 "15k" H 3868 4555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3800 4600 50  0001 C CNN
F 3 "~" H 3800 4600 50  0001 C CNN
	1    3800 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US Rd1
U 1 1 5FD3BD7A
P 3800 4400
F 0 "Rd1" H 3868 4446 50  0000 L CNN
F 1 "15k" H 3868 4355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3800 4400 50  0001 C CNN
F 3 "~" H 3800 4400 50  0001 C CNN
	1    3800 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5FD36B12
P 3650 3200
F 0 "#PWR08" H 3650 2950 50  0001 C CNN
F 1 "GND" H 3655 3027 50  0000 C CNN
F 2 "" H 3650 3200 50  0001 C CNN
F 3 "" H 3650 3200 50  0001 C CNN
	1    3650 3200
	1    0    0    -1  
$EndComp
Text Notes 5300 3400 2    50   ~ 0
In-amp 4\nG4=11
$Comp
L power:GND #PWR017
U 1 1 5FD2DF0A
P 5500 3200
F 0 "#PWR017" H 5500 2950 50  0001 C CNN
F 1 "GND" H 5505 3027 50  0000 C CNN
F 2 "" H 5500 3200 50  0001 C CNN
F 3 "" H 5500 3200 50  0001 C CNN
	1    5500 3200
	1    0    0    -1  
$EndComp
Text GLabel 5500 2600 2    50   Input ~ 0
Vcc
Wire Wire Line
	4600 2700 5200 2700
Wire Wire Line
	4600 3200 4600 2700
Wire Wire Line
	3850 3200 4600 3200
Wire Wire Line
	4150 3100 5200 3100
Wire Wire Line
	4150 2900 4150 3100
Wire Wire Line
	2650 3100 3350 3100
Wire Wire Line
	2650 2950 2650 3100
Wire Wire Line
	2650 2700 3350 2700
Wire Wire Line
	2650 2850 2650 2700
Wire Wire Line
	5200 2800 4950 2800
Wire Wire Line
	4950 3000 5200 3000
$Comp
L Device:R_Small_US Rg4
U 1 1 5FD2DEF6
P 4950 2900
F 0 "Rg4" H 5018 2946 50  0000 L CNN
F 1 "10k" H 5018 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4950 2900 50  0001 C CNN
F 3 "~" H 4950 2900 50  0001 C CNN
	1    4950 2900
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Instrumentation:AD623 A4
U 1 1 5FD2DEF0
P 5600 2900
F 0 "A4" H 6044 2946 50  0000 L CNN
F 1 "AD623" H 6044 2855 50  0000 L CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 5600 2900 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD623.pdf" H 5600 2900 50  0001 C CNN
	1    5600 2900
	1    0    0    -1  
$EndComp
Text Notes 3450 3400 2    50   ~ 0
In-amp 3\nG3=50
Text Notes 1500 3250 2    50   ~ 0
PIR\nLongwave \nradiometer \n+/- 2mV\n\n\n
Wire Wire Line
	3350 2800 3100 2800
Wire Wire Line
	3100 3000 3350 3000
Text GLabel 3650 2600 2    50   Input ~ 0
Vcc
$Comp
L Device:R_Small_US Rg3
U 1 1 5FD2DEDF
P 3100 2900
F 0 "Rg3" H 3168 2946 50  0000 L CNN
F 1 "2k" H 3168 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3100 2900 50  0001 C CNN
F 3 "~" H 3100 2900 50  0001 C CNN
	1    3100 2900
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Instrumentation:AD623 A3
U 1 1 5FD2DED9
P 3750 2900
F 0 "A3" H 4194 2946 50  0000 L CNN
F 1 "AD623" H 4194 2855 50  0000 L CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 3750 2900 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD623.pdf" H 3750 2900 50  0001 C CNN
	1    3750 2900
	1    0    0    -1  
$EndComp
Text Notes 6150 1700 2    50   ~ 0
In-amp 2\nG2=4
$Comp
L power:GND #PWR018
U 1 1 5FD29E14
P 5700 2150
F 0 "#PWR018" H 5700 1900 50  0001 C CNN
F 1 "GND" H 5705 1977 50  0000 C CNN
F 2 "" H 5700 2150 50  0001 C CNN
F 3 "" H 5700 2150 50  0001 C CNN
	1    5700 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5FD299CD
P 5500 2150
F 0 "#PWR016" H 5500 1900 50  0001 C CNN
F 1 "GND" H 5505 1977 50  0000 C CNN
F 2 "" H 5500 2150 50  0001 C CNN
F 3 "" H 5500 2150 50  0001 C CNN
	1    5500 2150
	1    0    0    -1  
$EndComp
Text GLabel 5500 1550 2    50   Input ~ 0
Vcc
Wire Wire Line
	4600 1650 5200 1650
Wire Wire Line
	4600 2150 4600 1650
Wire Wire Line
	3850 2150 4600 2150
Wire Wire Line
	4150 2050 5200 2050
Wire Wire Line
	4150 1850 4150 2050
Wire Wire Line
	2650 2050 3350 2050
Wire Wire Line
	2650 1900 2650 2050
Wire Wire Line
	2400 1900 2650 1900
Wire Wire Line
	2650 1650 3350 1650
Wire Wire Line
	2650 1800 2650 1650
Wire Wire Line
	2400 1800 2650 1800
Wire Wire Line
	5200 1750 4950 1750
Wire Wire Line
	4950 1950 5200 1950
$Comp
L Device:R_Small_US Rg2
U 1 1 5FD253CA
P 4950 1850
F 0 "Rg2" H 5018 1896 50  0000 L CNN
F 1 "33k" H 5018 1805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4950 1850 50  0001 C CNN
F 3 "~" H 4950 1850 50  0001 C CNN
	1    4950 1850
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Instrumentation:AD623 A2
U 1 1 5FD253C4
P 5600 1850
F 0 "A2" H 6044 1896 50  0000 L CNN
F 1 "AD623" H 6044 1805 50  0000 L CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 5600 1850 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD623.pdf" H 5600 1850 50  0001 C CNN
	1    5600 1850
	1    0    0    -1  
$EndComp
Text Notes 4300 1700 2    50   ~ 0
In-amp 1 \nG1=50
Text Notes 2100 1900 2    50   ~ 0
SPP \nShortwave \nradiometer \n0-10mV\n\n\n
Text Notes 1650 950  2    50   ~ 0
Vin \nBattery \n12-15 V\n
Wire Wire Line
	3350 1750 3100 1750
Wire Wire Line
	3100 1950 3350 1950
Text GLabel 3650 1550 2    50   Input ~ 0
Vcc
$Comp
L power:GND #PWR07
U 1 1 5FD1EB4C
P 3650 2150
F 0 "#PWR07" H 3650 1900 50  0001 C CNN
F 1 "GND" H 3655 1977 50  0000 C CNN
F 2 "" H 3650 2150 50  0001 C CNN
F 3 "" H 3650 2150 50  0001 C CNN
	1    3650 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US Rg1
U 1 1 5FD1D950
P 3100 1850
F 0 "Rg1" H 3168 1896 50  0000 L CNN
F 1 "2k" H 3168 1805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3100 1850 50  0001 C CNN
F 3 "~" H 3100 1850 50  0001 C CNN
	1    3100 1850
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Instrumentation:AD623 A1
U 1 1 5FD1C718
P 3750 1850
F 0 "A1" H 4194 1896 50  0000 L CNN
F 1 "AD623" H 4194 1805 50  0000 L CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 3750 1850 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD623.pdf" H 3750 1850 50  0001 C CNN
	1    3750 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5FD1C2D4
P 2200 1900
F 0 "J2" H 2118 1575 50  0000 C CNN
F 1 "SWR" H 2118 1666 50  0000 C CNN
F 2 "digikey-footprints:Term_Block_1x2_P5mm" H 2200 1900 50  0001 C CNN
F 3 "~" H 2200 1900 50  0001 C CNN
F 4 "+" H 2200 1900 50  0001 C CNN "Function"
	1    2200 1900
	-1   0    0    1   
$EndComp
Connection ~ 3900 1050
Wire Wire Line
	3900 1050 4550 1050
Connection ~ 3900 750 
Wire Wire Line
	3900 750  4250 750 
Connection ~ 4850 1050
Wire Wire Line
	4850 1050 5450 1050
$Comp
L power:GND #PWR010
U 1 1 5FD19ADE
P 5450 1050
F 0 "#PWR010" H 5450 800 50  0001 C CNN
F 1 "GND" H 5455 877 50  0000 C CNN
F 2 "" H 5450 1050 50  0001 C CNN
F 3 "" H 5450 1050 50  0001 C CNN
	1    5450 1050
	1    0    0    -1  
$EndComp
Connection ~ 4850 750 
Wire Wire Line
	4850 750  5300 750 
Text GLabel 5300 750  2    50   Input ~ 0
Vcc
Wire Wire Line
	3900 950  3900 1050
Connection ~ 4550 1050
Wire Wire Line
	4850 1050 4850 950 
Wire Wire Line
	4550 1050 4850 1050
$Comp
L Device:CP1_Small C2
U 1 1 5FD186FB
P 4850 850
F 0 "C2" H 4941 896 50  0000 L CNN
F 1 "10uF" H 4941 805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 4850 850 50  0001 C CNN
F 3 "~" H 4850 850 50  0001 C CNN
	1    4850 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C1
U 1 1 5FD174CC
P 3900 850
F 0 "C1" H 3991 896 50  0000 L CNN
F 1 "0.33uF" H 3991 805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 3900 850 50  0001 C CNN
F 3 "~" H 3900 850 50  0001 C CNN
	1    3900 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 900  2150 1050
$Comp
L Regulator_Linear:L78L10_TO92 U1
U 1 1 5FD13AD4
P 4550 750
F 0 "U1" H 4550 992 50  0000 C CNN
F 1 "L78L10_TO92" H 4550 901 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4550 975 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 4550 700 50  0001 C CNN
	1    4550 750 
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US Ra1
U 1 1 5FEA76E5
P 2600 5650
F 0 "Ra1" V 2805 5650 50  0000 C CNN
F 1 "10k" V 2714 5650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 2600 5650 50  0001 C CNN
F 3 "~" H 2600 5650 50  0001 C CNN
	1    2600 5650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5FEAE519
P 3900 6400
F 0 "#PWR011" H 3900 6150 50  0001 C CNN
F 1 "GND" H 3905 6227 50  0000 C CNN
F 2 "" H 3900 6400 50  0001 C CNN
F 3 "" H 3900 6400 50  0001 C CNN
	1    3900 6400
	1    0    0    -1  
$EndComp
Text GLabel 5200 6100 2    47   Input ~ 0
Vcc
Text GLabel 2900 7350 2    47   Input ~ 0
Vcc
$Comp
L Device:R_Small_US Rb1
U 1 1 5FEBF1E1
P 2600 6350
F 0 "Rb1" V 2805 6350 50  0000 C CNN
F 1 "10k" V 2714 6350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 2600 6350 50  0001 C CNN
F 3 "~" H 2600 6350 50  0001 C CNN
	1    2600 6350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2500 6350 2400 6350
$Comp
L power:GND #PWR01
U 1 1 5FEC1340
P 2250 5750
F 0 "#PWR01" H 2250 5500 50  0001 C CNN
F 1 "GND" H 2255 5577 50  0000 C CNN
F 2 "" H 2250 5750 50  0001 C CNN
F 3 "" H 2250 5750 50  0001 C CNN
	1    2250 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5FEC176B
P 2250 6450
F 0 "#PWR02" H 2250 6200 50  0001 C CNN
F 1 "GND" H 2255 6277 50  0000 C CNN
F 2 "" H 2250 6450 50  0001 C CNN
F 3 "" H 2250 6450 50  0001 C CNN
	1    2250 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6350 2700 6350
Wire Wire Line
	3150 6350 3150 5650
Wire Wire Line
	3150 5650 2700 5650
Connection ~ 3150 6350
Connection ~ 2400 6350
Text Notes 5650 5550 2    51   ~ 0
A3 Arduino\n
Text Notes 6350 6150 2    51   ~ 0
A4 Arduino\n
Text Notes 7100 2250 2    51   ~ 0
In: 0 - 4400mV \nOut: 0 - 22mV \nbefore saturation\n\n
Text Notes 7000 3400 2    51   ~ 0
In: +/- 3mV\nOut: 1650mV +/- 1650mV\nbefore saturation\n\n\n
Text Notes 2200 6300 2    50   ~ 0
Case Thermistor\n
Text Notes 2350 5600 2    50   ~ 0
Dome Thermistor
Text Notes 6650 6400 2    50   ~ 0
3.26V (Rc=18.8k @10*C) \n1.79V (Rc=5.6k @40*C)\n
Text Notes 6000 5800 2    50   ~ 0
3.26V (Rd=18.8k @10*C) \n1.79V (Rd=5.6k @40*C)\n
$Comp
L Connector:Screw_Terminal_01x02 J6
U 1 1 5FF9D034
P 9400 700
F 0 "J6" V 9364 512 50  0000 R CNN
F 1 "Power 5V" V 9273 512 50  0000 R CNN
F 2 "digikey-footprints:Term_Block_1x2_P5mm" H 9400 700 50  0001 C CNN
F 3 "~" H 9400 700 50  0001 C CNN
	1    9400 700 
	0    -1   -1   0   
$EndComp
Text Notes 10050 1250 2    51   ~ 0
Vin Arduino\n
Text Notes 1450 2250 2    50   ~ 0
Leave optional \npin for C filter\nat in-amp inputs
$Comp
L power:GND #PWR06
U 1 1 5FFBD5DF
P 3200 1500
F 0 "#PWR06" H 3200 1250 50  0001 C CNN
F 1 "GND" H 3205 1327 50  0000 C CNN
F 2 "" H 3200 1500 50  0001 C CNN
F 3 "" H 3200 1500 50  0001 C CNN
	1    3200 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5FFC3799
P 3450 4600
F 0 "C7" H 3542 4646 50  0000 L CNN
F 1 "0.1uF" H 3542 4555 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 3450 4600 50  0001 C CNN
F 3 "~" H 3450 4600 50  0001 C CNN
	1    3450 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1300 3650 1550
$Comp
L Device:CP1_Small C3
U 1 1 5FFF0FA2
P 3200 1400
F 0 "C3" H 3291 1446 50  0000 L CNN
F 1 "10uF" H 3291 1355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 3200 1400 50  0001 C CNN
F 3 "~" H 3200 1400 50  0001 C CNN
	1    3200 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1300 3650 1300
$Comp
L Device:CP1_Small C4
U 1 1 5FFFC4F4
P 5000 1400
F 0 "C4" H 5091 1446 50  0000 L CNN
F 1 "10uF" H 5091 1355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 5000 1400 50  0001 C CNN
F 3 "~" H 5000 1400 50  0001 C CNN
	1    5000 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5FFFF6B1
P 5000 1500
F 0 "#PWR015" H 5000 1250 50  0001 C CNN
F 1 "GND" H 5005 1327 50  0000 C CNN
F 2 "" H 5000 1500 50  0001 C CNN
F 3 "" H 5000 1500 50  0001 C CNN
	1    5000 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1550 5500 1300
Wire Wire Line
	5500 1300 5000 1300
$Comp
L power:GND #PWR05
U 1 1 6000B7EB
P 3050 2450
F 0 "#PWR05" H 3050 2200 50  0001 C CNN
F 1 "GND" H 3055 2277 50  0000 C CNN
F 2 "" H 3050 2450 50  0001 C CNN
F 3 "" H 3050 2450 50  0001 C CNN
	1    3050 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C5
U 1 1 6000B7F1
P 3050 2350
F 0 "C5" H 3141 2396 50  0000 L CNN
F 1 "10uF" H 3141 2305 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 3050 2350 50  0001 C CNN
F 3 "~" H 3050 2350 50  0001 C CNN
	1    3050 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2250 3450 2250
Wire Wire Line
	3450 2250 3450 2550
Wire Wire Line
	3450 2550 3650 2550
Wire Wire Line
	3650 2550 3650 2600
$Comp
L power:GND #PWR014
U 1 1 6001994A
P 4950 2450
F 0 "#PWR014" H 4950 2200 50  0001 C CNN
F 1 "GND" H 4955 2277 50  0000 C CNN
F 2 "" H 4950 2450 50  0001 C CNN
F 3 "" H 4950 2450 50  0001 C CNN
	1    4950 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C6
U 1 1 60019950
P 4950 2350
F 0 "C6" H 5041 2396 50  0000 L CNN
F 1 "10uF" H 5041 2305 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 4950 2350 50  0001 C CNN
F 3 "~" H 4950 2350 50  0001 C CNN
	1    4950 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2250 5350 2250
Wire Wire Line
	5350 2250 5350 2600
Wire Wire Line
	5350 2600 5500 2600
$Comp
L Device:C_Small C9
U 1 1 600226F5
P 2750 1400
F 0 "C9" H 2842 1446 50  0000 L CNN
F 1 "0.1uF" H 2842 1355 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 2750 1400 50  0001 C CNN
F 3 "~" H 2750 1400 50  0001 C CNN
	1    2750 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1300 2750 1300
Connection ~ 3200 1300
Wire Wire Line
	2750 1500 3200 1500
Connection ~ 3200 1500
$Comp
L Device:C_Small C10
U 1 1 60032DBD
P 4550 1400
F 0 "C10" H 4642 1446 50  0000 L CNN
F 1 "0.1uF" H 4642 1355 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 4550 1400 50  0001 C CNN
F 3 "~" H 4550 1400 50  0001 C CNN
	1    4550 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1300 4550 1300
Wire Wire Line
	4550 1500 5000 1500
$Comp
L Device:C_Small C11
U 1 1 60036C95
P 2600 2350
F 0 "C11" H 2692 2396 50  0000 L CNN
F 1 "0.1uF" H 2692 2305 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 2600 2350 50  0001 C CNN
F 3 "~" H 2600 2350 50  0001 C CNN
	1    2600 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2250 2600 2250
Wire Wire Line
	2600 2450 3050 2450
$Comp
L Device:C_Small C12
U 1 1 6003AE4C
P 4500 2350
F 0 "C12" H 4592 2396 50  0000 L CNN
F 1 "0.1uF" H 4592 2305 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 4500 2350 50  0001 C CNN
F 3 "~" H 4500 2350 50  0001 C CNN
	1    4500 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2250 4500 2250
Wire Wire Line
	4500 2450 4950 2450
Text Notes 1650 1200 2    50   ~ 0
Relay to enable/disable \nmeasure circuit
$Comp
L Connector:Screw_Terminal_01x06 J3
U 1 1 5FDB4F4A
P 950 4650
F 0 "J3" H 868 4125 50  0000 C CNN
F 1 "LWR" H 868 4216 50  0000 C CNN
F 2 "digikey-footprints:Term_Block_1x6_P5mm" H 950 4650 50  0001 C CNN
F 3 "~" H 950 4650 50  0001 C CNN
	1    950  4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	1150 4350 1550 4350
Wire Wire Line
	1550 4350 1550 2850
Wire Wire Line
	1550 2850 2650 2850
Wire Wire Line
	1150 4450 1700 4450
Wire Wire Line
	1700 4450 1700 2950
Wire Wire Line
	1700 2950 2650 2950
Wire Wire Line
	1150 4550 1700 4550
Wire Wire Line
	1700 4550 1700 5650
Wire Wire Line
	1150 4650 1600 4650
Wire Wire Line
	1600 4650 1600 5750
Wire Wire Line
	1600 5750 2250 5750
Wire Wire Line
	1150 4750 1500 4750
Wire Wire Line
	1500 4750 1500 6350
Wire Wire Line
	1500 6350 2400 6350
Wire Wire Line
	1150 4850 1400 4850
Wire Wire Line
	1400 4850 1400 6450
Wire Wire Line
	1400 6450 2250 6450
Text Notes 550  4450 0    39   ~ 0
thermopile
Text Notes 650  4850 0    39   ~ 0
RTD \ncase
Text Notes 650  4650 0    39   ~ 0
RTD \ndome
Text Notes 1800 1850 0    39   ~ 0
thermopile
Text Notes 8350 3700 0    50   ~ 0
Aref\n
Text Notes 8350 3600 0    50   ~ 0
A0\n
Text Notes 8350 3400 0    50   ~ 0
A2\n
Text Notes 8350 3300 0    50   ~ 0
A3\n
Text Notes 8350 3200 0    50   ~ 0
A4\n
Text Notes 8350 3500 0    50   ~ 0
A1\n
Text Notes 9950 3600 0    50   ~ 0
Vin 5V\n
Text Notes 9950 3500 0    50   ~ 0
Vcc 3.3V\n
Text Notes 9950 3400 0    50   ~ 0
GND\n
Text Notes 9950 3700 0    50   ~ 0
5V\n
Wire Wire Line
	6000 1850 7400 1850
Wire Wire Line
	7400 1850 7400 3450
Wire Wire Line
	7400 3450 8100 3450
Wire Wire Line
	6000 2900 7200 2900
Wire Wire Line
	7200 2900 7200 3350
Wire Wire Line
	7200 3350 8100 3350
Wire Wire Line
	9400 4050 9400 3350
Wire Wire Line
	9400 3350 9700 3350
Wire Wire Line
	9500 3550 9700 3550
$Comp
L Connector:Conn_01x14_Female J4
U 1 1 5FE48387
P 9900 2950
F 0 "J4" H 9750 3700 50  0000 L CNN
F 1 "Arduino right socket" V 10300 2650 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x14_P2.54mm_Vertical" H 9900 2950 50  0001 C CNN
F 3 "~" H 9900 2950 50  0001 C CNN
	1    9900 2950
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5FF7625D
P 3900 750
F 0 "#FLG01" H 3900 825 50  0001 C CNN
F 1 "PWR_FLAG" H 3900 923 50  0000 C CNN
F 2 "" H 3900 750 50  0001 C CNN
F 3 "~" H 3900 750 50  0001 C CNN
	1    3900 750 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5FF76FB3
P 5450 1050
F 0 "#FLG02" H 5450 1125 50  0001 C CNN
F 1 "PWR_FLAG" H 5450 1223 50  0000 C CNN
F 2 "" H 5450 1050 50  0001 C CNN
F 3 "~" H 5450 1050 50  0001 C CNN
	1    5450 1050
	1    0    0    -1  
$EndComp
Connection ~ 5450 1050
$Comp
L power:+12V #PWR0101
U 1 1 5FF85D85
P 2050 800
F 0 "#PWR0101" H 2050 650 50  0001 C CNN
F 1 "+12V" H 2065 973 50  0000 C CNN
F 2 "" H 2050 800 50  0001 C CNN
F 3 "" H 2050 800 50  0001 C CNN
	1    2050 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 800  2050 800 
Wire Wire Line
	2150 900  1950 900 
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5FD15D82
P 1750 900
F 0 "J1" H 1668 575 50  0000 L CNN
F 1 "Tbattery" H 1668 666 50  0000 L CNN
F 2 "digikey-footprints:Term_Block_1x2_P5mm" H 1750 900 50  0001 C CNN
F 3 "~" H 1750 900 50  0001 C CNN
	1    1750 900 
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5FF99D36
P 6250 700
F 0 "H1" H 6350 746 50  0000 L CNN
F 1 "MountingHole" H 6350 655 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 6250 700 50  0001 C CNN
F 3 "~" H 6250 700 50  0001 C CNN
	1    6250 700 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5FF9B2E5
P 6250 900
F 0 "H2" H 6350 946 50  0000 L CNN
F 1 "MountingHole" H 6350 855 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 6250 900 50  0001 C CNN
F 3 "~" H 6250 900 50  0001 C CNN
	1    6250 900 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5FFA1490
P 6250 1100
F 0 "H3" H 6350 1146 50  0000 L CNN
F 1 "MountingHole" H 6350 1055 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 6250 1100 50  0001 C CNN
F 3 "~" H 6250 1100 50  0001 C CNN
	1    6250 1100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5FFA7498
P 6250 1300
F 0 "H4" H 6350 1346 50  0000 L CNN
F 1 "MountingHole" H 6350 1255 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 6250 1300 50  0001 C CNN
F 3 "~" H 6250 1300 50  0001 C CNN
	1    6250 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1050 3900 1050
Wire Wire Line
	2500 800  2050 800 
Connection ~ 2050 800 
Wire Wire Line
	2500 750  2500 800 
Wire Wire Line
	2500 750  3900 750 
Wire Wire Line
	2900 7250 2900 7150
Wire Wire Line
	3150 7150 2900 7150
Wire Wire Line
	3150 6350 3150 7150
NoConn ~ 1550 7350
NoConn ~ 1550 7150
Text Notes 3100 7050 2    50   ~ 0
Precision\n5V ref\n
$Comp
L MAX6043:MAX6043AAUT33-G16 U4
U 1 1 5FDCBBC9
P 2800 4400
F 0 "U4" H 2775 4887 60  0000 C CNN
F 1 "MAX6043BAUT33+T" H 2775 4781 60  0000 C CNN
F 2 "00_Mylib:MAX6043AAUT33-G16" H 2800 4790 60  0001 C CNN
F 3 "" H 2100 4500 60  0000 C CNN
	1    2800 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4400 3450 4300
Wire Wire Line
	3450 4300 3800 4300
Connection ~ 3450 4300
Connection ~ 3800 4300
$Comp
L power:GND #PWR024
U 1 1 5FE2B919
P 3450 4700
F 0 "#PWR024" H 3450 4450 50  0001 C CNN
F 1 "GND" H 3455 4527 50  0000 C CNN
F 2 "" H 3450 4700 50  0001 C CNN
F 3 "" H 3450 4700 50  0001 C CNN
	1    3450 4700
	1    0    0    -1  
$EndComp
NoConn ~ 2100 4500
NoConn ~ 2100 4300
Text GLabel 3450 4500 2    50   Input ~ 0
Vcc
$Comp
L LM358AP:LM358P U2-rtd1
U 1 1 5FE7AD01
P 4550 6250
F 0 "U2-rtd1" H 4550 6687 60  0000 C CNN
F 1 "LM358P" H 4550 6581 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 4550 6540 60  0001 C CNN
F 3 "" H 3900 6400 60  0000 C CNN
	1    4550 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 6300 5200 6200
Wire Wire Line
	3900 6200 3900 6100
Wire Wire Line
	5200 6200 7800 6200
Connection ~ 5200 6200
Wire Wire Line
	2400 6650 5200 6650
Wire Wire Line
	5200 6650 5200 6400
Wire Wire Line
	2400 6350 2400 6650
Wire Wire Line
	7650 5600 3900 5600
Wire Wire Line
	3900 5600 3900 6100
Connection ~ 3900 6100
Wire Wire Line
	1700 5650 2450 5650
Wire Wire Line
	2450 5650 2450 5300
Wire Wire Line
	2450 5300 3500 5300
Wire Wire Line
	3500 5300 3500 6300
Wire Wire Line
	3500 6300 3900 6300
Connection ~ 2450 5650
Wire Wire Line
	2450 5650 2500 5650
$Comp
L LM358AP:LM358P U5-aref1
U 1 1 5FF2A920
P 5500 4450
F 0 "U5-aref1" H 5500 4887 60  0000 C CNN
F 1 "LM358P" H 5500 4781 60  0000 C CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 5500 4740 60  0001 C CNN
F 3 "" H 4850 4600 60  0000 C CNN
	1    5500 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3800 4850 3800
Wire Wire Line
	6150 4500 6150 4400
Wire Wire Line
	4850 4300 4850 4400
Wire Wire Line
	6150 4400 8100 4400
Connection ~ 6150 4400
Wire Wire Line
	8100 3650 8100 4400
Wire Wire Line
	3800 4500 4850 4500
Wire Wire Line
	4850 4300 4850 3800
Connection ~ 4850 4300
Connection ~ 4850 3800
Wire Wire Line
	4850 3800 5700 3800
Wire Wire Line
	6150 4600 6150 5000
Wire Wire Line
	6150 5000 4250 5000
Wire Wire Line
	4250 5000 4250 4300
NoConn ~ 8100 2350
NoConn ~ 8100 2550
NoConn ~ 8100 2650
NoConn ~ 8100 2750
NoConn ~ 8100 2850
NoConn ~ 8100 2950
NoConn ~ 8100 3050
NoConn ~ 8100 3550
NoConn ~ 9700 2350
NoConn ~ 9700 2450
NoConn ~ 9700 2850
NoConn ~ 9700 2950
NoConn ~ 9700 3050
NoConn ~ 9700 3150
NoConn ~ 9700 3250
NoConn ~ 9700 3650
$Comp
L power:GND #PWR020
U 1 1 5FFAD4EC
P 9400 900
F 0 "#PWR020" H 9400 650 50  0001 C CNN
F 1 "GND" H 9405 727 50  0000 C CNN
F 2 "" H 9400 900 50  0001 C CNN
F 3 "" H 9400 900 50  0001 C CNN
	1    9400 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 900  9500 1100
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 6004CB31
P 9500 1100
F 0 "#FLG0101" H 9500 1175 50  0001 C CNN
F 1 "PWR_FLAG" V 9500 1228 50  0000 L CNN
F 2 "" H 9500 1100 50  0001 C CNN
F 3 "~" H 9500 1100 50  0001 C CNN
	1    9500 1100
	0    1    1    0   
$EndComp
Connection ~ 9500 1100
Wire Wire Line
	9500 1100 9500 3550
Connection ~ 2900 7150
$Comp
L MAX6043:MAX6043AAUT33-G16 U3
U 1 1 5FD5B94F
P 2250 7250
F 0 "U3" H 2225 7737 60  0000 C CNN
F 1 "MAX6043BAUT50+T" H 2225 7631 60  0000 C CNN
F 2 "00_Mylib:MAX6043AAUT33-G16" H 2250 7640 60  0001 C CNN
F 3 "" H 1550 7350 60  0000 C CNN
	1    2250 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3250 7800 3250
Wire Wire Line
	7800 3250 7800 6200
Wire Wire Line
	8100 3150 7650 3150
Wire Wire Line
	7650 3150 7650 5600
Text Notes 8350 3100 0    50   ~ 0
A5\n
Text Notes 8350 3000 0    50   ~ 0
A6\n
Text Notes 8350 2900 0    50   ~ 0
D0\n
Text Notes 8350 2800 0    50   ~ 0
D1\n
Text Notes 8350 2700 0    50   ~ 0
D2\n
Text Notes 8350 2600 0    50   ~ 0
D3\n
Text Notes 8350 2500 0    50   ~ 0
D4\n
Text Notes 8350 2400 0    50   ~ 0
D5
Text Notes 9950 3300 0    50   ~ 0
RST\n
Text Notes 9950 3200 0    50   ~ 0
Tx\n
Text Notes 9950 3100 0    50   ~ 0
Rx\n
Text Notes 9950 3000 0    50   ~ 0
SCL\n
Text Notes 9950 2900 0    50   ~ 0
SDA\n
Text Notes 9950 2800 0    50   ~ 0
MISO\n
Text Notes 9950 2700 0    50   ~ 0
SCK\n
Text Notes 9950 2600 0    50   ~ 0
MOSI\n
Text Notes 9950 2500 0    50   ~ 0
D7\n
Text Notes 9950 2400 0    50   ~ 0
D6
$Comp
L Connector:Micro_SD_Card J7
U 1 1 5FDC47D8
P 10350 5450
F 0 "J7" H 10300 6167 50  0000 C CNN
F 1 "Micro_SD_Card" H 10300 6076 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Wuerth_693072010801" H 11500 5750 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 10350 5450 50  0001 C CNN
	1    10350 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5FDCDC52
P 11150 6050
F 0 "#PWR012" H 11150 5800 50  0001 C CNN
F 1 "GND" H 11155 5877 50  0000 C CNN
F 2 "" H 11150 6050 50  0001 C CNN
F 3 "" H 11150 6050 50  0001 C CNN
	1    11150 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5FDCE8F5
P 8800 6000
F 0 "#PWR04" H 8800 5750 50  0001 C CNN
F 1 "GND" H 8805 5827 50  0000 C CNN
F 2 "" H 8800 6000 50  0001 C CNN
F 3 "" H 8800 6000 50  0001 C CNN
	1    8800 6000
	1    0    0    -1  
$EndComp
Text Notes 10200 2100 2    51   ~ 0
3.3V pins
Wire Wire Line
	9450 5450 9250 5450
Wire Wire Line
	9250 3450 9700 3450
NoConn ~ 9450 5150
NoConn ~ 9450 5850
$Comp
L Device:R_Small R1
U 1 1 5FE13F02
P 9350 4800
F 0 "R1" H 9409 4846 50  0000 L CNN
F 1 "10k" H 9409 4755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 9350 4800 50  0001 C CNN
F 3 "~" H 9350 4800 50  0001 C CNN
	1    9350 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 3450 9250 4425
Wire Wire Line
	9350 4900 9350 5250
Connection ~ 9350 5250
Wire Wire Line
	9350 5250 9450 5250
Wire Wire Line
	9350 4700 9250 4700
Connection ~ 9250 4700
Wire Wire Line
	9250 4700 9250 5450
Wire Wire Line
	9450 5350 8850 5350
Wire Wire Line
	8850 5350 8850 2550
Wire Wire Line
	8850 2550 9700 2550
$Comp
L Connector:Conn_01x14_Female J5
U 1 1 5FE4B1F9
P 8300 2950
F 0 "J5" H 8150 3700 50  0000 L CNN
F 1 "Arduino analog side" V 8700 2550 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x14_P2.54mm_Vertical" H 8300 2950 50  0001 C CNN
F 3 "~" H 8300 2950 50  0001 C CNN
	1    8300 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2075 7950 2450
Wire Wire Line
	7950 2450 8100 2450
Wire Wire Line
	8600 5250 8600 2075
Wire Wire Line
	8600 5250 9350 5250
Wire Wire Line
	8600 2075 7950 2075
Wire Wire Line
	9450 5550 8975 5550
Wire Wire Line
	8975 5550 8975 2650
Wire Wire Line
	8975 2650 9700 2650
Wire Wire Line
	9700 2750 9075 2750
Wire Wire Line
	9075 2750 9075 5750
Wire Wire Line
	9075 5750 9450 5750
Wire Wire Line
	8800 5650 8800 6000
Wire Wire Line
	8800 5650 9450 5650
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5FED6EAF
P 9825 4425
F 0 "#FLG0102" H 9825 4500 50  0001 C CNN
F 1 "PWR_FLAG" H 9825 4598 50  0000 C CNN
F 2 "" H 9825 4425 50  0001 C CNN
F 3 "~" H 9825 4425 50  0001 C CNN
	1    9825 4425
	1    0    0    -1  
$EndComp
Wire Wire Line
	9825 4425 9250 4425
Connection ~ 9250 4425
Wire Wire Line
	9250 4425 9250 4700
$Comp
L power:GND #PWR013
U 1 1 5FDEAD92
P 2100 4400
F 0 "#PWR013" H 2100 4150 50  0001 C CNN
F 1 "GND" H 2105 4227 50  0000 C CNN
F 2 "" H 2100 4400 50  0001 C CNN
F 3 "" H 2100 4400 50  0001 C CNN
	1    2100 4400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5FDEB609
P 1550 7250
F 0 "#PWR03" H 1550 7000 50  0001 C CNN
F 1 "GND" H 1555 7077 50  0000 C CNN
F 2 "" H 1550 7250 50  0001 C CNN
F 3 "" H 1550 7250 50  0001 C CNN
	1    1550 7250
	0    1    1    0   
$EndComp
$EndSCHEMATC
