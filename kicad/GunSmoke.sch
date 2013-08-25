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
LIBS:km6816
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
L 82S129 U3
U 1 1 520A33E3
P 20450 16250
F 0 "U3" H 20450 16900 60  0000 C CNN
F 1 "82S129" H 20450 15600 60  0000 C CNN
F 2 "Red Palette PROM" V 20450 16250 60  0000 C CNB
F 3 "" H 20450 16250 60  0000 C CNN
F 4 "128" H 20450 16250 60  0000 C CNN "Field11"
	1    20450 16250
	1    0    0    -1  
$EndComp
$Comp
L 82S129 U4
U 1 1 520A3401
P 20450 17750
F 0 "U4" H 20450 18400 60  0000 C CNN
F 1 "82S129" H 20450 17100 60  0000 C CNN
F 2 "Green Palette PROM" V 20450 17750 60  0000 C CNB
F 3 "" H 20450 17750 60  0000 C CNN
F 4 "128" H 20450 17750 60  0000 C CNN "Field11"
	1    20450 17750
	1    0    0    -1  
$EndComp
$Comp
L 82S129 U5
U 1 1 520A340E
P 20450 19250
F 0 "U5" H 20450 19900 60  0000 C CNN
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
$Comp
L 74LS273 U13
U 1 1 520AEEBB
P 19000 20800
F 0 "U13" H 19000 20650 60  0000 C CNN
F 1 "74LS273" H 19000 20450 60  0000 C CNN
F 2 "8bit D-FlipFlops" V 19000 20800 60  0000 C CNB
F 3 "" H 19000 20800 60  0000 C CNN
	1    19000 20800
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 520B7B30
P 19650 20000
F 0 "#PWR?" H 19650 20000 30  0001 C CNN
F 1 "GND" H 19650 19930 30  0001 C CNN
F 2 "" H 19650 20000 60  0000 C CNN
F 3 "" H 19650 20000 60  0000 C CNN
	1    19650 20000
	1    0    0    -1  
$EndComp
$Comp
L 82S129 U33
U 1 1 520B7CBA
P 17450 22500
F 0 "U33" H 17450 23150 60  0000 C CNN
F 1 "82S129" H 17450 21850 60  0000 C CNN
F 2 "" H 17450 22500 60  0000 C CNN
F 3 "" H 17450 22500 60  0000 C CNN
F 4 "128" H 17450 22500 60  0000 C CNN "Field11"
	1    17450 22500
	1    0    0    -1  
$EndComp
$Comp
L 74LS153 U23
U 1 1 520B7F31
P 21350 22400
F 0 "U23" H 21350 22700 60  0000 C CNN
F 1 "74LS153" H 21350 22550 60  0000 C CNN
F 2 "dual MUX 4:1" H 21350 22400 60  0000 C CNB
F 3 "" H 21350 22400 60  0000 C CNN
	1    21350 22400
	-1   0    0    1   
$EndComp
$Comp
L 74LS153 U24
U 1 1 520B83D3
P 21350 24100
F 0 "U24" H 21350 24400 60  0000 C CNN
F 1 "74LS153" H 21350 24250 60  0000 C CNN
F 2 "dual MUX 4:1" H 21350 24100 60  0000 C CNB
F 3 "" H 21350 24100 60  0000 C CNN
	1    21350 24100
	-1   0    0    1   
$EndComp
$Comp
L 74LS153 U25
U 1 1 520B85FE
P 21350 25800
F 0 "U25" H 21350 26100 60  0000 C CNN
F 1 "74LS153" H 21350 25950 60  0000 C CNN
F 2 "dual MUX 4:1" H 21350 25800 60  0000 C CNB
F 3 "" H 21350 25800 60  0000 C CNN
	1    21350 25800
	-1   0    0    1   
$EndComp
$Comp
L 74LS74 U14
U 1 1 520B88A7
P 17450 20800
F 0 "U14" H 17600 21100 60  0000 C CNN
F 1 "74LS74" H 17750 20505 60  0000 C CNN
F 2 "" H 17450 20800 60  0000 C CNN
F 3 "" H 17450 20800 60  0000 C CNN
	1    17450 20800
	1    0    0    -1  
$EndComp
$Comp
L 74LS74 U14
U 2 1 520B89CC
P 16050 20800
F 0 "U14" H 16200 21100 60  0000 C CNN
F 1 "74LS74" H 16350 20505 60  0000 C CNN
F 2 "" H 16050 20800 60  0000 C CNN
F 3 "" H 16050 20800 60  0000 C CNN
	2    16050 20800
	1    0    0    -1  
$EndComp
$Comp
L 74LS00 U15
U 4 1 520B8B6F
P 14400 20600
F 0 "U15" H 14400 20650 60  0000 C CNN
F 1 "74LS00" H 14400 20500 60  0000 C CNN
F 2 "" H 14400 20600 60  0000 C CNN
F 3 "" H 14400 20600 60  0000 C CNN
	4    14400 20600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 520B8C2E
P 15850 21250
F 0 "#PWR?" H 15850 21340 20  0001 C CNN
F 1 "+5V" H 15850 21340 30  0000 C CNN
F 2 "" H 15850 21250 60  0000 C CNN
F 3 "" H 15850 21250 60  0000 C CNN
	1    15850 21250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 520B91DD
P 22450 26750
F 0 "#PWR?" H 22450 26750 30  0001 C CNN
F 1 "GND" H 22450 26680 30  0001 C CNN
F 2 "" H 22450 26750 60  0000 C CNN
F 3 "" H 22450 26750 60  0000 C CNN
	1    22450 26750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 520B9451
P 16700 23350
F 0 "#PWR?" H 16700 23350 30  0001 C CNN
F 1 "GND" H 16700 23280 30  0001 C CNN
F 2 "" H 16700 23350 60  0000 C CNN
F 3 "" H 16700 23350 60  0000 C CNN
	1    16700 23350
	1    0    0    -1  
$EndComp
$Comp
L 74LS174 U35
U 1 1 520B96C1
P 12200 22500
F 0 "U35" H 12200 22550 60  0000 C CNN
F 1 "74LS174" H 12200 22350 60  0000 C CNN
F 2 "" H 12200 22500 60  0000 C CNN
F 3 "" H 12200 22500 60  0000 C CNN
	1    12200 22500
	1    0    0    -1  
$EndComp
$Comp
L 74LS20 U34
U 2 1 520B9776
P 15200 23750
F 0 "U34" H 15200 23850 60  0000 C CNN
F 1 "74LS20" H 15200 23650 60  0000 C CNN
F 2 "" H 15200 23750 60  0000 C CNN
F 3 "" H 15200 23750 60  0000 C CNN
	2    15200 23750
	1    0    0    -1  
$EndComp
$Comp
L 74LS20 U34
U 1 1 520B9838
P 15200 24500
F 0 "U34" H 15200 24600 60  0000 C CNN
F 1 "74LS20" H 15200 24400 60  0000 C CNN
F 2 "" H 15200 24500 60  0000 C CNN
F 3 "" H 15200 24500 60  0000 C CNN
	1    15200 24500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 520C2ACC
P 11150 21800
F 0 "#PWR?" H 11150 21890 20  0001 C CNN
F 1 "+5V" H 11150 21890 30  0000 C CNN
F 2 "" H 11150 21800 60  0000 C CNN
F 3 "" H 11150 21800 60  0000 C CNN
	1    11150 21800
	1    0    0    -1  
$EndComp
$Comp
L 74LS174 U42
U 1 1 520C2EDF
P 24150 21650
F 0 "U42" H 24150 21700 60  0000 C CNN
F 1 "74LS174" H 24150 21500 60  0000 C CNN
F 2 "" H 24150 21650 60  0000 C CNN
F 3 "" H 24150 21650 60  0000 C CNN
	1    24150 21650
	1    0    0    -1  
$EndComp
$Comp
L 82S129 U17
U 1 1 52105FF8
P 9550 22700
F 0 "U17" H 9550 23350 60  0000 C CNN
F 1 "82S129" H 9550 22050 60  0000 C CNN
F 2 "" H 9550 22700 60  0000 C CNN
F 3 "" H 9550 22700 60  0000 C CNN
F 4 "128" H 9550 22700 60  0000 C CNN "Field11"
	1    9550 22700
	1    0    0    -1  
$EndComp
$Comp
L 74LS157 U18
U 1 1 521066BE
P 7000 22700
F 0 "U18" H 7050 22850 60  0000 C CNN
F 1 "74LS157" H 7050 22550 60  0000 C CNN
F 2 "" H 7000 22700 60  0000 C CNN
F 3 "" H 7000 22700 60  0000 C CNN
	1    7000 22700
	1    0    0    -1  
$EndComp
$Comp
L 74LS194 U29
U 1 1 5210693F
P 4250 22050
F 0 "U29" H 4350 22050 60  0000 C CNN
F 1 "74LS194" H 4350 21900 60  0000 C CNN
F 2 "shift register" H 4250 22050 60  0000 C CNB
F 3 "" H 4250 22050 60  0000 C CNN
	1    4250 22050
	1    0    0    -1  
$EndComp
$Comp
L 74LS194 U30
U 1 1 52106951
P 4250 24100
F 0 "U30" H 4350 24100 60  0000 C CNN
F 1 "74LS194" H 4350 23950 60  0000 C CNN
F 2 "shift register" H 4250 24100 60  0000 C CNN
F 3 "" H 4250 24100 60  0000 C CNN
	1    4250 24100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 52107F03
P 6150 21900
F 0 "#PWR?" H 6150 21990 20  0001 C CNN
F 1 "+5V" H 6150 21990 30  0000 C CNN
F 2 "" H 6150 21900 60  0000 C CNN
F 3 "" H 6150 21900 60  0000 C CNN
	1    6150 21900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52107F17
P 6000 23600
F 0 "#PWR?" H 6000 23600 30  0001 C CNN
F 1 "GND" H 6000 23530 30  0001 C CNN
F 2 "" H 6000 23600 60  0000 C CNN
F 3 "" H 6000 23600 60  0000 C CNN
	1    6000 23600
	1    0    0    -1  
$EndComp
$Comp
L 74LS86 U27
U 4 1 521080BC
P 6150 24650
F 0 "U27" H 6200 24700 50  0000 C CNN
F 1 "74LS86" H 6200 24600 40  0000 C CNN
F 2 "" H 6150 24650 60  0000 C CNN
F 3 "" H 6150 24650 60  0000 C CNN
	4    6150 24650
	0    -1   -1   0   
$EndComp
$Comp
L 74LS86 U27
U 3 1 52108415
P 6800 24650
F 0 "U27" H 6850 24700 50  0000 C CNN
F 1 "74LS86" H 6850 24600 40  0000 C CNN
F 2 "" H 6800 24650 60  0000 C CNN
F 3 "" H 6800 24650 60  0000 C CNN
	3    6800 24650
	0    -1   -1   0   
$EndComp
$Comp
L 74LS86 U27
U 2 1 5210878C
P 7350 24650
F 0 "U27" H 7400 24700 50  0000 C CNN
F 1 "74LS86" H 7400 24600 40  0000 C CNN
F 2 "" H 7350 24650 60  0000 C CNN
F 3 "" H 7350 24650 60  0000 C CNN
	2    7350 24650
	0    -1   -1   0   
$EndComp
$Comp
L 74LS86 U27
U 1 1 521087A3
P 7900 24650
F 0 "U27" H 7950 24700 50  0000 C CNN
F 1 "74LS86" H 7950 24600 40  0000 C CNN
F 2 "" H 7900 24650 60  0000 C CNN
F 3 "" H 7900 24650 60  0000 C CNN
	1    7900 24650
	0    -1   -1   0   
$EndComp
$Comp
L 74LS04 U16
U 2 1 52108914
P 6250 26050
F 0 "U16" H 6445 26165 60  0000 C CNN
F 1 "74LS04" H 6440 25925 60  0000 C CNN
F 2 "" H 6250 26050 60  0000 C CNN
F 3 "" H 6250 26050 60  0000 C CNN
	2    6250 26050
	0    -1   -1   0   
$EndComp
$Comp
L 74LS273 U12
U 1 1 52108FA5
P 4700 27050
F 0 "U12" H 4700 26900 60  0000 C CNN
F 1 "74LS273" H 4700 26700 60  0000 C CNN
F 2 "" H 4700 27050 60  0000 C CNN
F 3 "" H 4700 27050 60  0000 C CNN
	1    4700 27050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52109124
P 8000 25750
F 0 "#PWR?" H 8000 25750 30  0001 C CNN
F 1 "GND" H 8000 25680 30  0001 C CNN
F 2 "" H 8000 25750 60  0000 C CNN
F 3 "" H 8000 25750 60  0000 C CNN
	1    8000 25750
	1    0    0    -1  
$EndComp
$Comp
L 74LS86 U28
U 3 1 5210988E
P 9500 24650
F 0 "U28" H 9550 24700 50  0000 C CNN
F 1 "74LS86" H 9550 24600 40  0000 C CNN
F 2 "" H 9500 24650 60  0000 C CNN
F 3 "" H 9500 24650 60  0000 C CNN
	3    9500 24650
	0    -1   -1   0   
$EndComp
$Comp
L 74LS86 U28
U 2 1 52109A6D
P 10050 24650
F 0 "U28" H 10100 24700 50  0000 C CNN
F 1 "74LS86" H 10100 24600 40  0000 C CNN
F 2 "" H 10050 24650 60  0000 C CNN
F 3 "" H 10050 24650 60  0000 C CNN
	2    10050 24650
	0    -1   -1   0   
$EndComp
$Comp
L 74LS86 U28
U 1 1 52109F96
P 10600 24650
F 0 "U28" H 10650 24700 50  0000 C CNN
F 1 "74LS86" H 10650 24600 40  0000 C CNN
F 2 "" H 10600 24650 60  0000 C CNN
F 3 "" H 10600 24650 60  0000 C CNN
	1    10600 24650
	0    -1   -1   0   
$EndComp
$Comp
L 74LS86 U28
U 4 1 5210A42E
P 8950 24650
F 0 "U28" H 9000 24700 50  0000 C CNN
F 1 "74LS86" H 9000 24600 40  0000 C CNN
F 2 "" H 8950 24650 60  0000 C CNN
F 3 "" H 8950 24650 60  0000 C CNN
	4    8950 24650
	0    -1   -1   0   
$EndComp
$Comp
L 74LS174 U22
U 1 1 52114F26
P 26550 20650
F 0 "U22" H 26550 20700 60  0000 C CNN
F 1 "74LS174" H 26550 20500 60  0000 C CNN
F 2 "" H 26550 20650 60  0000 C CNN
F 3 "" H 26550 20650 60  0000 C CNN
	1    26550 20650
	-1   0    0    1   
$EndComp
$Comp
L 82S129 IC11
U 1 1 52115B45
P 28700 18850
F 0 "IC11" H 28700 19500 60  0000 C CNN
F 1 "82S129" H 28700 18200 60  0000 C CNN
F 2 "" H 28700 18850 60  0000 C CNN
F 3 "" H 28700 18850 60  0000 C CNN
F 4 "128" H 28700 18850 60  0000 C CNN "Field11"
	1    28700 18850
	-1   0    0    1   
$EndComp
$Comp
L 82S129 IC10
U 1 1 52115B63
P 28700 20550
F 0 "IC10" H 28700 21200 60  0000 C CNN
F 1 "82S129" H 28700 19900 60  0000 C CNN
F 2 "" H 28700 20550 60  0000 C CNN
F 3 "" H 28700 20550 60  0000 C CNN
F 4 "128" H 28700 20550 60  0000 C CNN "Field11"
	1    28700 20550
	-1   0    0    1   
$EndComp
$Comp
L 74LS161 IC107
U 1 1 52140BB7
P 39050 8750
F 0 "IC107" H 39100 8850 60  0000 C CNN
F 1 "74LS161" H 39150 8550 60  0000 C CNN
F 2 "" H 39050 8750 60  0000 C CNN
F 3 "" H 39050 8750 60  0000 C CNN
	1    39050 8750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 521424B9
P 38050 11350
F 0 "#PWR?" H 38050 11350 30  0001 C CNN
F 1 "GND" H 38050 11280 30  0001 C CNN
F 2 "" H 38050 11350 60  0000 C CNN
F 3 "" H 38050 11350 60  0000 C CNN
	1    38050 11350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3850 7900 3850
Wire Wire Line
	7900 3950 7250 3950
Wire Wire Line
	7250 4050 7900 4050
Wire Wire Line
	9100 4550 9500 4550
Wire Wire Line
	10700 4550 11200 4550
Wire Wire Line
	11500 2550 11800 2550
Wire Wire Line
	11800 2550 11800 3700
Wire Wire Line
	11800 3700 10950 3700
Wire Wire Line
	10950 3700 9350 3700
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
Wire Wire Line
	19200 15750 19850 15750
Wire Wire Line
	19100 15850 19850 15850
Wire Wire Line
	19000 15950 19850 15950
Wire Wire Line
	18900 16050 19850 16050
Wire Wire Line
	19200 15750 19200 17250
Wire Wire Line
	19200 17250 19200 18750
Wire Wire Line
	19200 18750 19200 20100
Wire Wire Line
	19100 15850 19100 17350
Wire Wire Line
	19100 17350 19100 18850
Wire Wire Line
	19100 18850 19100 20100
Wire Wire Line
	19000 15950 19000 17450
Wire Wire Line
	19000 17450 19000 18950
Wire Wire Line
	19000 18950 19000 20100
Wire Wire Line
	18900 16050 18900 17550
Wire Wire Line
	18900 17550 18900 19050
Wire Wire Line
	18900 19050 18900 20100
Wire Wire Line
	19850 16150 18800 16150
Wire Wire Line
	18800 16150 18800 17650
Wire Wire Line
	18800 17650 18800 19150
Wire Wire Line
	18800 19150 18800 20100
Wire Wire Line
	19850 16250 18700 16250
Wire Wire Line
	18700 16250 18700 17750
Wire Wire Line
	18700 17750 18700 19250
Wire Wire Line
	18700 19250 18700 20100
Wire Wire Line
	19850 16350 18600 16350
Wire Wire Line
	18600 16350 18600 17850
Wire Wire Line
	18600 17850 18600 19350
Wire Wire Line
	18600 19350 18600 20100
Wire Wire Line
	19850 16450 18500 16450
Wire Wire Line
	18500 16450 18500 17950
Wire Wire Line
	18500 17950 18500 19450
Wire Wire Line
	18500 19450 18500 20100
Wire Wire Line
	19850 17250 19200 17250
Connection ~ 19200 17250
Wire Wire Line
	19100 17350 19850 17350
Connection ~ 19100 17350
Wire Wire Line
	19850 17450 19000 17450
Connection ~ 19000 17450
Wire Wire Line
	19850 17550 18900 17550
Connection ~ 18900 17550
Wire Wire Line
	19850 17650 18800 17650
Connection ~ 18800 17650
Wire Wire Line
	19850 17750 18700 17750
Connection ~ 18700 17750
Wire Wire Line
	19850 17850 18600 17850
Connection ~ 18600 17850
Wire Wire Line
	19850 17950 18500 17950
Connection ~ 18500 17950
Wire Wire Line
	19850 18750 19200 18750
Connection ~ 19200 18750
Wire Wire Line
	19850 18850 19100 18850
Connection ~ 19100 18850
Wire Wire Line
	19850 18950 19000 18950
Connection ~ 19000 18950
Wire Wire Line
	19850 19050 18900 19050
Connection ~ 18900 19050
Wire Wire Line
	19850 19150 18800 19150
Connection ~ 18800 19150
Wire Wire Line
	19850 19250 18700 19250
Connection ~ 18700 19250
Wire Wire Line
	19850 19350 18600 19350
Connection ~ 18600 19350
Wire Wire Line
	19850 19450 18500 19450
Connection ~ 18500 19450
Wire Wire Line
	19850 19650 19850 19750
Wire Wire Line
	19850 18250 19850 18150
Wire Wire Line
	19850 16650 19850 16750
Wire Wire Line
	19850 16650 19650 16650
Wire Wire Line
	19650 16650 19650 18150
Wire Wire Line
	19650 18150 19650 19650
Wire Wire Line
	19650 19650 19650 20000
Wire Wire Line
	19850 18150 19650 18150
Wire Wire Line
	19650 19650 19850 19650
Connection ~ 19650 18150
Connection ~ 19650 19650
Wire Wire Line
	18050 22300 18500 22300
Wire Wire Line
	18500 22300 18500 21500
Wire Wire Line
	18050 22200 18600 22200
Wire Wire Line
	18600 22200 18600 21500
Wire Wire Line
	20600 22250 18700 22250
Wire Wire Line
	18700 22250 18700 21500
Wire Wire Line
	18800 21500 18800 22900
Wire Wire Line
	18800 22900 20600 22900
Wire Wire Line
	18900 21500 18900 23950
Wire Wire Line
	18900 23950 20600 23950
Wire Wire Line
	19000 21500 19000 24600
Wire Wire Line
	19000 24600 20600 24600
Wire Wire Line
	19100 21500 19100 25650
Wire Wire Line
	19100 25650 20600 25650
Wire Wire Line
	19200 26300 20600 26300
Wire Wire Line
	19200 21500 19200 26300
Wire Wire Line
	19500 21500 19500 21650
Wire Wire Line
	18050 21000 18050 21650
Wire Wire Line
	18050 21650 19500 21650
Wire Wire Line
	16650 20600 16850 20600
Wire Wire Line
	15350 20800 15450 20800
Wire Wire Line
	15350 20050 15350 20150
Wire Wire Line
	15350 20150 15350 20800
Wire Wire Line
	15350 20150 16750 20150
Wire Wire Line
	16750 20150 16750 20800
Wire Wire Line
	16750 20800 16850 20800
Connection ~ 15350 20150
Wire Wire Line
	15000 20600 15450 20600
Wire Wire Line
	17450 21350 15850 21350
Wire Wire Line
	15850 21350 15850 21250
Wire Wire Line
	22100 22000 22450 22000
Wire Wire Line
	22450 22000 22450 22150
Wire Wire Line
	22450 22150 22450 22350
Wire Wire Line
	22450 22350 22450 22650
Wire Wire Line
	22450 22650 22450 22800
Wire Wire Line
	22450 22800 22450 23000
Wire Wire Line
	22450 23000 22450 23700
Wire Wire Line
	22450 23700 22450 24050
Wire Wire Line
	22450 24050 22450 24350
Wire Wire Line
	22450 24350 22450 24700
Wire Wire Line
	22450 24700 22450 25400
Wire Wire Line
	22450 25400 22450 25750
Wire Wire Line
	22450 25750 22450 26050
Wire Wire Line
	22450 26050 22450 26400
Wire Wire Line
	22450 26400 22450 26750
Wire Wire Line
	22450 23700 22100 23700
Wire Wire Line
	22450 25400 22100 25400
Connection ~ 22450 23700
Connection ~ 22450 25400
Wire Wire Line
	16700 22700 16850 22700
Wire Wire Line
	16700 22000 16700 22400
Wire Wire Line
	16700 22400 16700 22500
Wire Wire Line
	16700 22500 16700 22600
Wire Wire Line
	16700 22600 16700 22700
Wire Wire Line
	16700 22700 16700 22900
Wire Wire Line
	16700 22900 16700 23000
Wire Wire Line
	16700 23000 16700 23350
Wire Wire Line
	16850 22900 16700 22900
Connection ~ 16700 22900
Wire Wire Line
	16850 23000 16700 23000
Connection ~ 16700 23000
Wire Wire Line
	16850 22600 16700 22600
Connection ~ 16700 22700
Wire Wire Line
	16850 22500 16700 22500
Connection ~ 16700 22600
Wire Wire Line
	16850 22400 16700 22400
Connection ~ 16700 22500
Wire Wire Line
	16850 22000 16700 22000
Connection ~ 16700 22400
Wire Wire Line
	12900 22100 16850 22100
Wire Wire Line
	16850 22200 16450 22200
Wire Wire Line
	16450 22200 16450 23750
Wire Wire Line
	16450 23750 15800 23750
Wire Wire Line
	16850 22300 16500 22300
Wire Wire Line
	16500 22300 16500 24500
Wire Wire Line
	16500 24500 15800 24500
Wire Wire Line
	22100 26200 22200 26200
Wire Wire Line
	22200 26200 22200 26850
Wire Wire Line
	22200 26850 16000 26850
Wire Wire Line
	16000 26850 16000 22200
Wire Wire Line
	16000 22200 14500 22200
Wire Wire Line
	14500 22200 12900 22200
Wire Wire Line
	22100 24500 22200 24500
Wire Wire Line
	22200 24500 22200 24950
Wire Wire Line
	22200 24950 16050 24950
Wire Wire Line
	16050 24950 16050 22300
Wire Wire Line
	16050 22300 14300 22300
Wire Wire Line
	14300 22300 12900 22300
Wire Wire Line
	22100 22800 22450 22800
Connection ~ 22450 22800
Wire Wire Line
	22100 22650 22450 22650
Connection ~ 22450 22650
Wire Wire Line
	22100 23000 22450 23000
Connection ~ 22450 23000
Wire Wire Line
	22100 22350 22450 22350
Connection ~ 22450 22350
Wire Wire Line
	22100 22150 22450 22150
Connection ~ 22450 22150
Wire Wire Line
	11500 22900 11150 22900
Wire Wire Line
	11150 22900 11150 21800
Wire Wire Line
	18050 22000 20300 22000
Wire Wire Line
	20300 22000 20300 21350
Wire Wire Line
	20300 21350 22300 21350
Wire Wire Line
	22300 21350 22300 21800
Wire Wire Line
	22300 21800 22300 23500
Wire Wire Line
	22300 23500 22300 25200
Wire Wire Line
	22300 21800 22100 21800
Wire Wire Line
	18050 22100 20400 22100
Wire Wire Line
	20400 22100 20400 21450
Wire Wire Line
	20400 21450 22250 21450
Wire Wire Line
	22250 21700 22100 21700
Wire Wire Line
	24850 21550 25100 21550
Wire Wire Line
	25100 21550 25100 22250
Wire Wire Line
	25100 22250 22100 22250
Wire Wire Line
	22600 20750 25850 20750
Wire Wire Line
	22600 20750 22600 22450
Wire Wire Line
	22600 22450 22100 22450
Wire Wire Line
	24850 21450 25250 21450
Wire Wire Line
	25250 21450 25250 22900
Wire Wire Line
	25250 22900 22100 22900
Wire Wire Line
	24850 21650 25050 21650
Wire Wire Line
	25050 21650 25050 23950
Wire Wire Line
	25050 23950 25050 27250
Wire Wire Line
	25050 23950 22100 23950
Wire Wire Line
	22100 25650 25000 25650
Wire Wire Line
	25000 21750 25000 25650
Wire Wire Line
	25000 25650 25000 27550
Wire Wire Line
	25000 21750 24850 21750
Wire Wire Line
	22100 24600 25300 24600
Wire Wire Line
	25300 21350 25300 24600
Wire Wire Line
	25300 24600 25300 27400
Wire Wire Line
	22100 26300 25350 26300
Wire Wire Line
	25350 21250 25350 26300
Wire Wire Line
	25350 26300 25350 27650
Wire Wire Line
	25350 21250 24850 21250
Wire Wire Line
	22650 20650 25850 20650
Wire Wire Line
	22650 20650 22650 24150
Wire Wire Line
	22650 24150 22100 24150
Wire Wire Line
	22700 20550 25850 20550
Wire Wire Line
	22700 20550 22700 25850
Wire Wire Line
	22700 25850 22100 25850
Wire Wire Line
	22850 20850 25850 20850
Wire Wire Line
	22850 20850 22850 23100
Wire Wire Line
	22850 23100 22100 23100
Wire Wire Line
	22900 20950 25850 20950
Wire Wire Line
	22900 20950 22900 24800
Wire Wire Line
	22900 24800 22100 24800
Wire Wire Line
	22100 26500 22950 26500
Wire Wire Line
	22950 26500 22950 21050
Wire Wire Line
	22950 21050 25850 21050
Wire Wire Line
	22250 23400 22100 23400
Connection ~ 22250 21700
Wire Wire Line
	22300 23500 22100 23500
Connection ~ 22300 21800
Wire Wire Line
	22250 25100 22100 25100
Connection ~ 22250 23400
Wire Wire Line
	22300 25200 22100 25200
Connection ~ 22300 23500
Wire Wire Line
	22250 21450 22250 21700
Wire Wire Line
	22250 21700 22250 23400
Wire Wire Line
	22250 23400 22250 25100
Wire Wire Line
	22100 25550 22250 25550
Wire Wire Line
	22250 25550 22250 26900
Wire Wire Line
	22250 26900 16100 26900
Wire Wire Line
	16100 26900 16100 22500
Wire Wire Line
	16100 22500 14400 22500
Wire Wire Line
	14400 22500 12900 22500
Wire Wire Line
	22100 25750 22450 25750
Connection ~ 22450 25750
Wire Wire Line
	22100 24050 22450 24050
Connection ~ 22450 24050
Wire Wire Line
	12900 22400 14200 22400
Wire Wire Line
	14200 22400 16150 22400
Wire Wire Line
	16150 22400 16150 25000
Wire Wire Line
	16150 25000 22550 25000
Wire Wire Line
	22550 25000 22550 23850
Wire Wire Line
	22550 23850 22100 23850
Wire Wire Line
	22100 24350 22450 24350
Connection ~ 22450 24350
Wire Wire Line
	22100 26050 22450 26050
Connection ~ 22450 26050
Wire Wire Line
	22100 24700 22450 24700
Connection ~ 22450 24700
Wire Wire Line
	22100 26400 22450 26400
Connection ~ 22450 26400
Wire Wire Line
	14300 24550 14600 24550
Wire Wire Line
	14300 22300 14300 24550
Wire Wire Line
	25050 27250 13850 27250
Wire Wire Line
	13850 27250 13850 23900
Wire Wire Line
	13850 23900 14600 23900
Connection ~ 25050 23950
Wire Wire Line
	14400 24450 14600 24450
Wire Wire Line
	14400 22500 14400 24450
Connection ~ 14300 22300
Connection ~ 14400 22500
Wire Wire Line
	14500 22200 14500 24350
Wire Wire Line
	14500 24350 14600 24350
Connection ~ 14500 22200
Wire Wire Line
	14600 24650 14200 24650
Wire Wire Line
	14200 24650 14200 22400
Connection ~ 14200 22400
Wire Wire Line
	25350 27650 13550 27650
Wire Wire Line
	13550 27650 13550 23600
Wire Wire Line
	13550 23600 14600 23600
Connection ~ 25350 26300
Wire Wire Line
	14600 23700 13650 23700
Wire Wire Line
	13650 23700 13650 27550
Wire Wire Line
	13650 27550 25000 27550
Connection ~ 25000 25650
Wire Wire Line
	14600 23800 13750 23800
Wire Wire Line
	13750 23800 13750 27400
Wire Wire Line
	13750 27400 25300 27400
Connection ~ 25300 24600
Wire Wire Line
	25300 21350 24850 21350
Wire Wire Line
	11500 22200 10150 22200
Wire Wire Line
	11500 22500 10950 22500
Wire Wire Line
	10950 22500 10950 22300
Wire Wire Line
	10950 22300 10150 22300
Wire Wire Line
	10150 22400 11250 22400
Wire Wire Line
	11250 22400 11250 22300
Wire Wire Line
	11250 22300 11500 22300
Wire Wire Line
	11500 22400 11350 22400
Wire Wire Line
	11350 22400 11350 22550
Wire Wire Line
	11350 22550 10900 22550
Wire Wire Line
	10900 22550 10900 22500
Wire Wire Line
	10900 22500 10150 22500
Wire Wire Line
	8950 22200 7750 22200
Wire Wire Line
	7750 22450 7900 22450
Wire Wire Line
	7900 22450 7900 22300
Wire Wire Line
	7900 22300 8950 22300
Wire Wire Line
	3550 22450 3400 22450
Wire Wire Line
	3400 22450 3400 24500
Wire Wire Line
	3400 24500 3400 25100
Wire Wire Line
	3400 24500 3550 24500
Wire Wire Line
	3550 24650 3450 24650
Wire Wire Line
	3450 24650 3450 22600
Wire Wire Line
	3450 22600 3550 22600
Wire Wire Line
	3550 22300 3350 22300
Wire Wire Line
	3350 22300 3350 24350
Wire Wire Line
	3350 24350 3550 24350
Wire Wire Line
	3550 24250 3300 24250
Wire Wire Line
	3300 24250 3300 22200
Wire Wire Line
	3300 22200 3550 22200
Wire Wire Line
	3550 22050 3250 22050
Wire Wire Line
	3250 22050 3250 24100
Wire Wire Line
	3250 24100 3550 24100
Wire Wire Line
	3550 24000 3200 24000
Wire Wire Line
	3200 24000 3200 21950
Wire Wire Line
	3200 21950 3550 21950
Wire Wire Line
	4950 21500 5700 21500
Wire Wire Line
	5700 21500 5700 22150
Wire Wire Line
	5700 22150 6250 22150
Wire Wire Line
	4950 21800 5600 21800
Wire Wire Line
	5600 21800 5600 22250
Wire Wire Line
	5600 22250 6250 22250
Wire Wire Line
	6250 22400 5600 22400
Wire Wire Line
	5600 22400 5600 23550
Wire Wire Line
	5600 23550 4950 23550
Wire Wire Line
	4950 23850 5700 23850
Wire Wire Line
	5700 23850 5700 22500
Wire Wire Line
	5700 22500 6250 22500
Wire Wire Line
	6250 22650 6050 22650
Wire Wire Line
	6050 22650 6050 23000
Wire Wire Line
	6050 23000 6250 23000
Wire Wire Line
	6250 22750 6150 22750
Wire Wire Line
	6150 21900 6150 22750
Wire Wire Line
	6150 22750 6150 22900
Wire Wire Line
	6150 22900 6250 22900
Connection ~ 6150 22750
Wire Wire Line
	6000 23600 6000 23250
Wire Wire Line
	6000 23250 6250 23250
Wire Wire Line
	6250 23150 6150 23150
Wire Wire Line
	6150 23150 6150 24050
Wire Wire Line
	6250 25250 6250 25400
Wire Wire Line
	6250 25400 6250 25600
Wire Wire Line
	6250 25400 6900 25400
Wire Wire Line
	6900 25400 7450 25400
Wire Wire Line
	6900 25400 6900 25250
Wire Wire Line
	7450 25400 7450 25250
Connection ~ 6900 25400
Connection ~ 6250 25400
Wire Wire Line
	5400 27050 6250 27050
Wire Wire Line
	6250 27050 6250 26500
Wire Wire Line
	8000 25250 8000 25500
Wire Wire Line
	8000 25500 8000 25750
Wire Wire Line
	6050 25500 8000 25500
Wire Wire Line
	6050 25250 6050 25500
Connection ~ 8000 25500
Wire Wire Line
	9600 25500 9600 25250
Wire Wire Line
	8600 25500 9600 25500
Wire Wire Line
	8600 25500 8600 23750
Wire Wire Line
	8600 23750 6800 23750
Wire Wire Line
	6800 23750 6800 24050
Wire Wire Line
	10150 25600 10150 25250
Wire Wire Line
	8450 25600 9050 25600
Wire Wire Line
	9050 25600 10150 25600
Wire Wire Line
	10150 25600 10700 25600
Wire Wire Line
	8450 25600 8450 23800
Wire Wire Line
	8450 23800 7350 23800
Wire Wire Line
	7350 23800 7350 24050
Wire Wire Line
	7900 24050 7900 23900
Wire Wire Line
	7900 23900 5850 23900
Wire Wire Line
	5850 23900 5850 24100
Wire Wire Line
	5850 24100 5150 24100
Wire Wire Line
	5150 24100 5150 25100
Wire Wire Line
	5150 25100 3400 25100
Connection ~ 3400 24500
Wire Wire Line
	10700 25600 10700 25250
Connection ~ 10150 25600
Wire Wire Line
	9050 25250 9050 25600
Connection ~ 9050 25600
Wire Wire Line
	29300 20050 29400 20050
Wire Wire Line
	29400 20050 29400 18350
Wire Wire Line
	29400 18350 29300 18350
Wire Wire Line
	29300 18450 29450 18450
Wire Wire Line
	29450 18450 29450 20150
Wire Wire Line
	29450 20150 29300 20150
Wire Wire Line
	29300 20350 29550 20350
Wire Wire Line
	29550 20350 29550 18650
Wire Wire Line
	29550 18650 29300 18650
Wire Wire Line
	29300 18750 29600 18750
Wire Wire Line
	29600 18750 29600 20450
Wire Wire Line
	29600 20450 29300 20450
Wire Wire Line
	29300 20550 29650 20550
Wire Wire Line
	29650 20550 29650 18850
Wire Wire Line
	29650 18850 29300 18850
Wire Wire Line
	29300 18950 29700 18950
Wire Wire Line
	29700 18950 29700 20650
Wire Wire Line
	29700 20650 29300 20650
Wire Wire Line
	29300 20750 29750 20750
Wire Wire Line
	29750 20750 29750 19050
Wire Wire Line
	29750 19050 29300 19050
Wire Wire Line
	29300 19150 29800 19150
Wire Wire Line
	29800 19150 29800 20850
Wire Wire Line
	29800 20850 29300 20850
Wire Wire Line
	29300 20950 29850 20950
Wire Wire Line
	29850 20950 29850 19250
Wire Wire Line
	29850 19250 29300 19250
Wire Wire Line
	29300 19350 29900 19350
Wire Wire Line
	29900 19350 29900 21050
Wire Wire Line
	29900 21050 29300 21050
Wire Wire Line
	28100 21050 27250 21050
Wire Wire Line
	27250 20950 27750 20950
Wire Wire Line
	27750 20950 27750 20850
Wire Wire Line
	27750 20850 28100 20850
Wire Wire Line
	38350 9250 38000 9250
Wire Wire Line
	38000 8100 38000 8250
Wire Wire Line
	38000 8250 38000 9250
Wire Wire Line
	38000 9250 38000 10950
Wire Wire Line
	38000 10950 38350 10950
Wire Wire Line
	38350 9050 38250 9050
Wire Wire Line
	38250 9050 38250 10750
Wire Wire Line
	38250 10750 38350 10750
Wire Wire Line
	38050 10250 38350 10250
Wire Wire Line
	38050 8550 38350 8550
Wire Wire Line
	38350 8750 38200 8750
Wire Wire Line
	38200 8750 38200 10450
Wire Wire Line
	38200 10450 38350 10450
Connection ~ 38050 8450
Connection ~ 38050 8550
Wire Wire Line
	38050 8350 38050 8450
Wire Wire Line
	38050 8450 38050 8550
Wire Wire Line
	38050 8550 38050 9950
Wire Wire Line
	38050 9950 38050 10050
Wire Wire Line
	38050 10050 38050 10150
Wire Wire Line
	38050 10150 38050 10250
Wire Wire Line
	38050 10250 38050 11350
Connection ~ 38050 10150
Connection ~ 38050 10050
Wire Wire Line
	38050 8350 38350 8350
Wire Wire Line
	38350 8450 38050 8450
Wire Wire Line
	38050 10050 38350 10050
Wire Wire Line
	38050 10150 38350 10150
Wire Wire Line
	38350 9950 38050 9950
Connection ~ 38050 9950
Connection ~ 38050 10250
Connection ~ 38000 9250
$Comp
L +5V #PWR?
U 1 1 52143263
P 38000 8100
F 0 "#PWR?" H 38000 8190 20  0001 C CNN
F 1 "+5V" H 38000 8190 30  0000 C CNN
F 2 "" H 38000 8100 60  0000 C CNN
F 3 "" H 38000 8100 60  0000 C CNN
	1    38000 8100
	1    0    0    -1  
$EndComp
Wire Wire Line
	38350 8250 38000 8250
Connection ~ 38000 8250
Wire Wire Line
	38350 8850 38350 8950
Wire Wire Line
	39750 8750 39750 9500
Wire Wire Line
	39750 9500 38300 9500
Wire Wire Line
	38300 9500 38300 10550
Wire Wire Line
	38300 10550 38300 10650
Wire Wire Line
	38300 10550 38350 10550
Wire Wire Line
	38300 10650 38350 10650
Connection ~ 38300 10550
$Comp
L 74LS161 IC106
U 1 1 52140BC9
P 39050 10450
F 0 "IC106" H 39100 10550 60  0000 C CNN
F 1 "74LS161" H 39150 10250 60  0000 C CNN
F 2 "" H 39050 10450 60  0000 C CNN
F 3 "" H 39050 10450 60  0000 C CNN
	1    39050 10450
	1    0    0    -1  
$EndComp
Wire Wire Line
	39750 8450 40250 8450
Wire Wire Line
	40250 8450 40250 8900
$Comp
L 74LS157 IC136
U 1 1 5214450F
P 41550 8950
F 0 "IC136" H 41600 9100 60  0000 C CNN
F 1 "74LS157" H 41600 8800 60  0000 C CNN
F 2 "" H 41550 8950 60  0000 C CNN
F 3 "" H 41550 8950 60  0000 C CNN
	1    41550 8950
	1    0    0    -1  
$EndComp
Wire Wire Line
	40250 8900 40800 8900
Wire Wire Line
	40800 9150 40050 9150
Wire Wire Line
	40050 9150 40050 8550
Wire Wire Line
	40050 8550 39750 8550
$Comp
L KM6816 IC127
U 1 1 52141C6F
P 44100 8950
F 0 "IC127" H 44300 8200 60  0000 C CNN
F 1 "KM6816" H 44150 9600 60  0000 C CNN
F 2 "static RAM" H 44100 8950 60  0000 C CNN
F 3 "" H 44100 8950 60  0000 C CNN
	1    44100 8950
	1    0    0    -1  
$EndComp
Wire Wire Line
	43450 9350 42800 9350
Wire Wire Line
	42800 9350 42800 8450
Wire Wire Line
	42800 8450 42300 8450
Wire Wire Line
	42300 8700 43150 8700
Wire Wire Line
	43150 8700 43150 8500
Wire Wire Line
	43150 8500 43450 8500
Wire Wire Line
	43450 8700 43250 8700
Wire Wire Line
	43250 8700 43250 8950
Wire Wire Line
	43250 8950 42300 8950
Wire Wire Line
	43450 8600 43200 8600
Wire Wire Line
	43200 8600 43200 9200
Wire Wire Line
	43200 9200 42300 9200
$EndSCHEMATC
