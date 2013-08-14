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
LIBS:special
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
LIBS:o_zilog
LIBS:ym2203
LIBS:o_memory
LIBS:GunSmoke-cache
EELAYER 24 0
EELAYER END
$Descr A0 46811 33110
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
$Comp
L Z80 U67
U 1 1 520853F3
P 6300 3750
F 0 "U67" H 6300 5100 60  0000 C CNN
F 1 "Z80" H 6300 2400 60  0000 C CNN
F 2 "Z80 (Sound CPU)" H 6300 3750 60  0000 C CNB
F 3 "" H 6300 3750 60  0000 C CNN
	1    6300 3750
	1    0    0    -1  
$EndComp
$Comp
L Z80 U?
U 1 1 52085405
P 3700 3800
F 0 "U?" H 3700 5150 60  0000 C CNN
F 1 "Z80" H 3700 2450 60  0000 C CNN
F 2 "Z80 (main CPU)" H 3700 3800 60  0000 C CNB
F 3 "" H 3700 3800 60  0000 C CNN
	1    3700 3800
	1    0    0    -1  
$EndComp
$Comp
L 74LS138 U89
U 1 1 52085492
P 8500 4200
F 0 "U89" H 8600 4700 60  0000 C CNN
F 1 "74LS138" H 8650 3651 60  0000 C CNN
F 2 "DEMUX" H 8500 4200 60  0000 C CNB
F 3 "" H 8500 4200 60  0000 C CNN
	1    8500 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3850 7900 3850
Wire Wire Line
	7900 3950 7250 3950
Wire Wire Line
	7250 4050 7900 4050
$Comp
L 74LS74 U92SUP
U 1 1 5208552F
P 10100 4750
F 0 "U92SUP" H 10250 5050 60  0000 C CNN
F 1 "74LS74" H 10400 4455 60  0000 C CNN
F 2 "D FLIPFLOP" H 10100 4750 60  0000 C TNB
F 3 "" H 10100 4750 60  0000 C CNN
	1    10100 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 4550 9500 4550
$Comp
L 74LS74 U92INF
U 2 1 520855E9
P 11800 4750
F 0 "U92INF" H 11950 5050 60  0000 C CNN
F 1 "74LS74" H 12100 4455 60  0000 C CNN
F 2 "D FLIP FLOP" H 11800 4750 60  0000 C CNB
F 3 "" H 11800 4750 60  0000 C CNN
	2    11800 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 4550 11200 4550
$Comp
L 74LS367 U88
U 1 1 520856E1
P 10800 2950
F 0 "U88" H 10800 2900 60  0000 C CNN
F 1 "74LS367" H 10900 2700 60  0000 C CNN
F 2 "Hex Bus Driver 3 state" V 10800 2950 60  0000 C CNB
F 3 "" H 10800 2950 60  0000 C CNN
	1    10800 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	11500 2550 11800 2550
Wire Wire Line
	11800 2550 11800 3700
Wire Wire Line
	11800 3700 9350 3700
Wire Wire Line
	10950 3700 10950 4750
Wire Wire Line
	10950 4750 11200 4750
Wire Wire Line
	9350 3700 9350 4750
Wire Wire Line
	9350 4750 9500 4750
Connection ~ 10950 3700
Wire Wire Line
	12400 4950 12550 4950
Wire Wire Line
	12550 4950 12550 3900
Wire Wire Line
	12550 3900 9950 3900
Wire Wire Line
	9950 3900 9950 3350
Wire Wire Line
	9950 3350 10100 3350
$Comp
L YM2203 U31
U 1 1 52086367
P 6700 9450
F 0 "U31" H 7100 8400 60  0000 C CNN
F 1 "YM2203" H 6500 9600 60  0000 C CNN
F 2 "" H 6800 9800 60  0000 C CNN
F 3 "" H 6800 9800 60  0000 C CNN
	1    6700 9450
	1    0    0    -1  
$EndComp
$Comp
L YM2203 U32
U 1 1 52086387
P 10000 9500
F 0 "U32" H 10400 8450 60  0000 C CNN
F 1 "YM2203" H 9800 9650 60  0000 C CNN
F 2 "" H 10100 9850 60  0000 C CNN
F 3 "" H 10100 9850 60  0000 C CNN
	1    10000 9500
	1    0    0    -1  
$EndComp
$Comp
L 82S129 U?
U 1 1 520A33E3
P 20450 16250
F 0 "U?" H 20450 16900 60  0000 C CNN
F 1 "82S129" H 20450 15600 60  0000 C CNN
F 2 "Red Palette PROM" V 20450 16250 60  0000 C CNB
F 3 "" H 20450 16250 60  0000 C CNN
F 4 "128" H 20450 16250 60  0000 C CNN "Field11"
	1    20450 16250
	1    0    0    -1  
$EndComp
$Comp
L 82S129 U?
U 1 1 520A3401
P 20450 17750
F 0 "U?" H 20450 18400 60  0000 C CNN
F 1 "82S129" H 20450 17100 60  0000 C CNN
F 2 "Green Palette PROM" V 20450 17750 60  0000 C CNB
F 3 "" H 20450 17750 60  0000 C CNN
F 4 "128" H 20450 17750 60  0000 C CNN "Field11"
	1    20450 17750
	1    0    0    -1  
$EndComp
$Comp
L 82S129 U?
U 1 1 520A340E
P 20450 19250
F 0 "U?" H 20450 19900 60  0000 C CNN
F 1 "82S129" H 20450 18600 60  0000 C CNN
F 2 "Blue Palette PROM" V 20450 19250 60  0000 C CNB
F 3 "" H 20450 19250 60  0000 C CNN
F 4 "128" H 20450 19250 60  0000 C CNN "Field11"
	1    20450 19250
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 520AE66C
P 21300 17800
F 0 "R5" V 21380 17800 40  0000 C CNN
F 1 "220" V 21307 17801 40  0000 C CNN
F 2 "" V 21230 17800 30  0000 C CNN
F 3 "" H 21300 17800 30  0000 C CNN
	1    21300 17800
	-1   0    0    1   
$EndComp
$Comp
L R R6
U 1 1 520AE67E
P 21600 17800
F 0 "R6" V 21680 17800 40  0000 C CNN
F 1 "470" V 21607 17801 40  0000 C CNN
F 2 "" V 21530 17800 30  0000 C CNN
F 3 "" H 21600 17800 30  0000 C CNN
	1    21600 17800
	-1   0    0    1   
$EndComp
$Comp
L R R7
U 1 1 520AE6A2
P 21900 17800
F 0 "R7" V 21980 17800 40  0000 C CNN
F 1 "1k" V 21907 17801 40  0000 C CNN
F 2 "" V 21830 17800 30  0000 C CNN
F 3 "" H 21900 17800 30  0000 C CNN
	1    21900 17800
	-1   0    0    1   
$EndComp
$Comp
L R R8
U 1 1 520AE6AD
P 22200 17800
F 0 "R8" V 22280 17800 40  0000 C CNN
F 1 "2.2k" V 22207 17801 40  0000 C CNN
F 2 "" V 22130 17800 30  0000 C CNN
F 3 "" H 22200 17800 30  0000 C CNN
	1    22200 17800
	-1   0    0    1   
$EndComp
Wire Wire Line
	21050 17550 21300 17550
Wire Wire Line
	21050 17450 21600 17450
Wire Wire Line
	21600 17450 21600 17550
Wire Wire Line
	21050 17350 21900 17350
Wire Wire Line
	21900 17350 21900 17550
Wire Wire Line
	21050 17250 22200 17250
Wire Wire Line
	22200 17250 22200 17550
Wire Wire Line
	21300 18050 22550 18050
$Comp
L R R?
U 1 1 520AE86C
P 21300 16300
F 0 "R?" V 21380 16300 40  0000 C CNN
F 1 "220" V 21307 16301 40  0000 C CNN
F 2 "" V 21230 16300 30  0000 C CNN
F 3 "" H 21300 16300 30  0000 C CNN
	1    21300 16300
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 520AE872
P 21600 16300
F 0 "R?" V 21680 16300 40  0000 C CNN
F 1 "470" V 21607 16301 40  0000 C CNN
F 2 "" V 21530 16300 30  0000 C CNN
F 3 "" H 21600 16300 30  0000 C CNN
	1    21600 16300
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 520AE878
P 21900 16300
F 0 "R?" V 21980 16300 40  0000 C CNN
F 1 "1k" V 21907 16301 40  0000 C CNN
F 2 "" V 21830 16300 30  0000 C CNN
F 3 "" H 21900 16300 30  0000 C CNN
	1    21900 16300
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 520AE87E
P 22200 16300
F 0 "R?" V 22280 16300 40  0000 C CNN
F 1 "2.2k" V 22207 16301 40  0000 C CNN
F 2 "" V 22130 16300 30  0000 C CNN
F 3 "" H 22200 16300 30  0000 C CNN
	1    22200 16300
	-1   0    0    1   
$EndComp
Wire Wire Line
	21050 16050 21300 16050
Wire Wire Line
	21050 15950 21600 15950
Wire Wire Line
	21600 15950 21600 16050
Wire Wire Line
	21050 15850 21900 15850
Wire Wire Line
	21900 15850 21900 16050
Wire Wire Line
	21050 15750 22200 15750
Wire Wire Line
	22200 15750 22200 16050
Wire Wire Line
	21300 16550 22550 16550
$Comp
L R R9
U 1 1 520AE88C
P 21300 19300
F 0 "R9" V 21380 19300 40  0000 C CNN
F 1 "220" V 21307 19301 40  0000 C CNN
F 2 "" V 21230 19300 30  0000 C CNN
F 3 "" H 21300 19300 30  0000 C CNN
	1    21300 19300
	-1   0    0    1   
$EndComp
$Comp
L R R10
U 1 1 520AE892
P 21600 19300
F 0 "R10" V 21680 19300 40  0000 C CNN
F 1 "470" V 21607 19301 40  0000 C CNN
F 2 "" V 21530 19300 30  0000 C CNN
F 3 "" H 21600 19300 30  0000 C CNN
	1    21600 19300
	-1   0    0    1   
$EndComp
$Comp
L R R11
U 1 1 520AE898
P 21900 19300
F 0 "R11" V 21980 19300 40  0000 C CNN
F 1 "1k" V 21907 19301 40  0000 C CNN
F 2 "" V 21830 19300 30  0000 C CNN
F 3 "" H 21900 19300 30  0000 C CNN
	1    21900 19300
	-1   0    0    1   
$EndComp
$Comp
L R R12
U 1 1 520AE89E
P 22200 19300
F 0 "R12" V 22280 19300 40  0000 C CNN
F 1 "2.2k" V 22207 19301 40  0000 C CNN
F 2 "" V 22130 19300 30  0000 C CNN
F 3 "" H 22200 19300 30  0000 C CNN
	1    22200 19300
	-1   0    0    1   
$EndComp
Wire Wire Line
	21050 19050 21300 19050
Wire Wire Line
	21050 18950 21600 18950
Wire Wire Line
	21600 18950 21600 19050
Wire Wire Line
	21050 18850 21900 18850
Wire Wire Line
	21900 18850 21900 19050
Wire Wire Line
	21050 18750 22200 18750
Wire Wire Line
	22200 18750 22200 19050
Wire Wire Line
	21300 19550 22550 19550
$EndSCHEMATC
