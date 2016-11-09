EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:potmux-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "PotMux - Pot line multiplexer for the C64"
Date "2016-10-24"
Rev "1"
Comp ""
Comment1 ""
Comment2 "Copyright Henning Bekel 2016.\\nThis documentation describes Open Hardware and is licensed under the CERN OHL v. 1.2.\\nYou may redistribute and modify this documentation under the terms of the CERN OHL v.1.2.\\n(http://ohwr.org/cernohl). This documentation is distributed WITHOUT ANY EXPRESS OR\\nIMPLIED WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS\\nFOR A PARTICULAR PURPOSE. Please see the CERN OHL v.1.2 for applicable conditions"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X07 P1
U 1 1 580E7A37
P 1450 1650
F 0 "P1" H 1450 2050 50  0000 C CNN
F 1 "SOCKET_LEFT" V 1550 1650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07" H 1450 1650 50  0001 C CNN
F 3 "" H 1450 1650 50  0000 C CNN
	1    1450 1650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X07 P3
U 1 1 580E7AAB
P 1900 1650
F 0 "P3" H 1900 2050 50  0000 C CNN
F 1 "SOCKET_RIGHT" V 2000 1650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07" H 1900 1650 50  0001 C CNN
F 3 "" H 1900 1650 50  0000 C CNN
	1    1900 1650
	-1   0    0    -1  
$EndComp
Text Label 1250 1350 2    60   ~ 0
POTBX
Text Label 1250 1450 2    60   ~ 0
POTX
Text Label 1250 1550 2    60   ~ 0
POTY
Text Label 1250 1650 2    60   ~ 0
POTBY
Text Label 1250 1750 2    60   ~ 0
PA7
Text Label 1250 1850 2    60   ~ 0
PA6
$Comp
L GND #PWR01
U 1 1 580E7B37
P 1250 1950
F 0 "#PWR01" H 1250 1700 50  0001 C CNN
F 1 "GND" H 1250 1800 50  0000 C CNN
F 2 "" H 1250 1950 50  0000 C CNN
F 3 "" H 1250 1950 50  0000 C CNN
	1    1250 1950
	1    0    0    -1  
$EndComp
Text Label 2100 1650 0    60   ~ 0
POTAY
Text Label 2100 1950 0    60   ~ 0
POTAX
$Comp
L CONN_01X06 P2
U 1 1 580E7C4B
P 1550 3050
F 0 "P2" H 1550 3400 50  0000 C CNN
F 1 "KEYMAN64" V 1650 3050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 1550 3050 50  0001 C CNN
F 3 "" H 1550 3050 50  0000 C CNN
	1    1550 3050
	1    0    0    -1  
$EndComp
Text Label 1350 2800 2    60   ~ 0
A1
Text Label 1350 2900 2    60   ~ 0
A2
Text Label 1350 3000 2    60   ~ 0
B1
Text Label 1350 3100 2    60   ~ 0
B2
Text Label 1350 3200 2    60   ~ 0
~EN
$Comp
L GND #PWR02
U 1 1 580E7E79
P 1350 3300
F 0 "#PWR02" H 1350 3050 50  0001 C CNN
F 1 "GND" H 1350 3150 50  0000 C CNN
F 2 "" H 1350 3300 50  0000 C CNN
F 3 "" H 1350 3300 50  0000 C CNN
	1    1350 3300
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG03
U 1 1 580E7FAD
P 750 7500
F 0 "#FLG03" H 750 7595 50  0001 C CNN
F 1 "PWR_FLAG" H 750 7680 50  0000 C CNN
F 2 "" H 750 7500 50  0000 C CNN
F 3 "" H 750 7500 50  0000 C CNN
	1    750  7500
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG04
U 1 1 580E7FCA
P 1200 7500
F 0 "#FLG04" H 1200 7595 50  0001 C CNN
F 1 "PWR_FLAG" H 1200 7680 50  0000 C CNN
F 2 "" H 1200 7500 50  0000 C CNN
F 3 "" H 1200 7500 50  0000 C CNN
	1    1200 7500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 580E8032
P 1200 7500
F 0 "#PWR05" H 1200 7250 50  0001 C CNN
F 1 "GND" H 1200 7350 50  0000 C CNN
F 2 "" H 1200 7500 50  0000 C CNN
F 3 "" H 1200 7500 50  0000 C CNN
	1    1200 7500
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR06
U 1 1 580E8048
P 750 7500
F 0 "#PWR06" H 750 7350 50  0001 C CNN
F 1 "VCC" H 750 7650 50  0000 C CNN
F 2 "" H 750 7500 50  0000 C CNN
F 3 "" H 750 7500 50  0000 C CNN
	1    750  7500
	-1   0    0    1   
$EndComp
$Comp
L 4052 U1
U 1 1 580E8125
P 4500 1950
F 0 "U1" H 4600 1950 50  0000 C CNN
F 1 "4052" H 4600 1750 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 4500 1950 60  0001 C CNN
F 3 "" H 4500 1950 60  0001 C CNN
	1    4500 1950
	1    0    0    -1  
$EndComp
Text Label 5200 1350 0    60   ~ 0
POTAX
Text Label 5200 1750 0    60   ~ 0
POTAY
$Comp
L GND #PWR07
U 1 1 580E82C2
P 5200 2450
F 0 "#PWR07" H 5200 2200 50  0001 C CNN
F 1 "GND" H 5200 2300 50  0000 C CNN
F 2 "" H 5200 2450 50  0000 C CNN
F 3 "" H 5200 2450 50  0000 C CNN
	1    5200 2450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 580E82E0
P 3800 2250
F 0 "#PWR08" H 3800 2000 50  0001 C CNN
F 1 "GND" H 3800 2100 50  0000 C CNN
F 2 "" H 3800 2250 50  0000 C CNN
F 3 "" H 3800 2250 50  0000 C CNN
	1    3800 2250
	0    1    1    0   
$EndComp
Text Label 3800 1350 2    60   ~ 0
A1
Text Label 3800 1750 2    60   ~ 0
A2
Text Label 3800 1550 2    60   ~ 0
A1
Text Label 3800 1950 2    60   ~ 0
A2
NoConn ~ 3800 1450
NoConn ~ 3800 1850
Text Label 3800 1650 2    60   ~ 0
POTX
Text Label 3800 2050 2    60   ~ 0
POTY
Text Label 3800 2450 2    60   ~ 0
~EN
Text Label 3800 2550 2    60   ~ 0
PA6
$Comp
L 4052 U2
U 1 1 580E8430
P 4500 3800
F 0 "U2" H 4600 3800 50  0000 C CNN
F 1 "4052" H 4600 3600 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 4500 3800 60  0001 C CNN
F 3 "" H 4500 3800 60  0001 C CNN
	1    4500 3800
	1    0    0    -1  
$EndComp
Text Label 5200 3200 0    60   ~ 0
POTBX
Text Label 5200 3600 0    60   ~ 0
POTBY
$Comp
L GND #PWR09
U 1 1 580E84A4
P 5200 4300
F 0 "#PWR09" H 5200 4050 50  0001 C CNN
F 1 "GND" H 5200 4150 50  0000 C CNN
F 2 "" H 5200 4300 50  0000 C CNN
F 3 "" H 5200 4300 50  0000 C CNN
	1    5200 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 580E84FF
P 3800 4100
F 0 "#PWR010" H 3800 3850 50  0001 C CNN
F 1 "GND" H 3800 3950 50  0000 C CNN
F 2 "" H 3800 4100 50  0000 C CNN
F 3 "" H 3800 4100 50  0000 C CNN
	1    3800 4100
	0    1    1    0   
$EndComp
Text Label 3800 4400 2    60   ~ 0
PA7
Text Label 3800 3200 2    60   ~ 0
B1
Text Label 3800 3600 2    60   ~ 0
B2
Text Label 3800 3400 2    60   ~ 0
B1
Text Label 3800 3800 2    60   ~ 0
B2
NoConn ~ 3800 3300
NoConn ~ 3800 3700
Text Label 3800 3500 2    60   ~ 0
POTX
Text Label 3800 3900 2    60   ~ 0
POTY
Text Label 3150 4300 2    60   ~ 0
~EN
$Comp
L R R1
U 1 1 580E88C9
P 3350 4150
F 0 "R1" V 3430 4150 50  0000 C CNN
F 1 "4k7" V 3350 4150 50  0000 C CNN
F 2 "Discret:R3" V 3280 4150 50  0001 C CNN
F 3 "" H 3350 4150 50  0000 C CNN
	1    3350 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4300 3800 4300
Connection ~ 3350 4300
$Comp
L VCC #PWR011
U 1 1 580E897D
P 3350 4000
F 0 "#PWR011" H 3350 3850 50  0001 C CNN
F 1 "VCC" H 3350 4150 50  0000 C CNN
F 2 "" H 3350 4000 50  0000 C CNN
F 3 "" H 3350 4000 50  0000 C CNN
	1    3350 4000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR012
U 1 1 580E8B82
P 6200 1850
F 0 "#PWR012" H 6200 1700 50  0001 C CNN
F 1 "VCC" H 6200 2000 50  0000 C CNN
F 2 "" H 6200 1850 50  0000 C CNN
F 3 "" H 6200 1850 50  0000 C CNN
	1    6200 1850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 580E8BA8
P 6200 1950
F 0 "C1" H 6210 2020 50  0000 L CNN
F 1 "100n" H 6210 1870 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 6200 1950 50  0001 C CNN
F 3 "" H 6200 1950 50  0000 C CNN
	1    6200 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 580E8C87
P 6200 2050
F 0 "#PWR013" H 6200 1800 50  0001 C CNN
F 1 "GND" H 6200 1900 50  0000 C CNN
F 2 "" H 6200 2050 50  0000 C CNN
F 3 "" H 6200 2050 50  0000 C CNN
	1    6200 2050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR014
U 1 1 580E8E28
P 6200 3550
F 0 "#PWR014" H 6200 3400 50  0001 C CNN
F 1 "VCC" H 6200 3700 50  0000 C CNN
F 2 "" H 6200 3550 50  0000 C CNN
F 3 "" H 6200 3550 50  0000 C CNN
	1    6200 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 580E8E2E
P 6200 3650
F 0 "C2" H 6210 3720 50  0000 L CNN
F 1 "100n" H 6210 3570 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 6200 3650 50  0001 C CNN
F 3 "" H 6200 3650 50  0000 C CNN
	1    6200 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 580E8E34
P 6200 3750
F 0 "#PWR015" H 6200 3500 50  0001 C CNN
F 1 "GND" H 6200 3600 50  0000 C CNN
F 2 "" H 6200 3750 50  0000 C CNN
F 3 "" H 6200 3750 50  0000 C CNN
	1    6200 3750
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR016
U 1 1 580E7B51
P 2100 1350
F 0 "#PWR016" H 2100 1200 50  0001 C CNN
F 1 "VCC" H 2100 1500 50  0000 C CNN
F 2 "" H 2100 1350 50  0000 C CNN
F 3 "" H 2100 1350 50  0000 C CNN
	1    2100 1350
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR017
U 1 1 580E9B1D
P 4500 1300
F 0 "#PWR017" H 4500 1150 50  0001 C CNN
F 1 "VCC" H 4500 1450 50  0000 C CNN
F 2 "" H 4500 1300 50  0000 C CNN
F 3 "" H 4500 1300 50  0000 C CNN
	1    4500 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 580E9B87
P 4500 2600
F 0 "#PWR018" H 4500 2350 50  0001 C CNN
F 1 "GND" H 4500 2450 50  0000 C CNN
F 2 "" H 4500 2600 50  0000 C CNN
F 3 "" H 4500 2600 50  0000 C CNN
	1    4500 2600
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR019
U 1 1 580E9C6A
P 4500 3150
F 0 "#PWR019" H 4500 3000 50  0001 C CNN
F 1 "VCC" H 4500 3300 50  0000 C CNN
F 2 "" H 4500 3150 50  0000 C CNN
F 3 "" H 4500 3150 50  0000 C CNN
	1    4500 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 580E9C8D
P 4500 4450
F 0 "#PWR020" H 4500 4200 50  0001 C CNN
F 1 "GND" H 4500 4300 50  0000 C CNN
F 2 "" H 4500 4450 50  0000 C CNN
F 3 "" H 4500 4450 50  0000 C CNN
	1    4500 4450
	1    0    0    -1  
$EndComp
NoConn ~ 2100 1450
NoConn ~ 2100 1550
NoConn ~ 2100 1750
NoConn ~ 2100 1850
$EndSCHEMATC
