;author: Felipe Sanches <juca@members.fsf.org>
;year: 2013
;This code is released to the public domain

SYSTEM: equ $c000
P1: equ $c001
P2: equ $c002
DSW1: equ $c003
DSW2: equ $c004
SOUND_COMMAND: equ $c800
HWCFG: equ $c804
VIDEORAM: equ $d000 ;videoram area: d000-d3ff
COLORRAM: equ $d400 ;videoram area: d400-d7ff
SPRITERAM: equ $f000 ;spriteram area: f000-ffff

SCROLLX: equ $d800
SCROLLY: equ $d802
VIDEOCFG: equ $d806
CLEAR_COLOR: equ $80 ; why?!

NO_SOUND: equ $ff
INPUT_MAP: equ $e000 ;byte
SOUND_ID: equ $e001 ;byte
PIXO_Y: equ $e002 ;byte

im 1; set interrupt mode = 1
ld sp, $f000 ; init stack pointer (RAM area: e000-efff)
ld a, $ff
ld (INPUT_MAP), a

ld a, NO_SOUND
ld (SOUND_COMMAND), a

call init_video
ld iy, VIDEORAM
ld a, 8
ld (PIXO_Y), a

infiniteloop:
ei
jr infiniteloop

ds $36, $0 ; fill in a block of NOPs

;;-------------------------------------

call check_user_input
ret

check_user_input:
ld a, (P1)
ld b, a
ld a, (INPUT_MAP)
cpl a
xor b

bit 4,a
jp nz, button1_not_pressed
call button1_pressed
ret

button1_not_pressed:
bit 5,a
jp nz, button2_not_pressed
call button2_pressed
ret

button2_not_pressed:
bit 6,a
jp nz, button3_not_pressed
call button3_pressed
ret

button3_not_pressed:
ld a, (SOUND_ID)
ld (SOUND_COMMAND), a
ret

button1_pressed:
push bc
push ix

ld b, 11  ;X
ld a, (PIXO_Y)
ld c, a
ld a, 2   ;Cor
ld ix, pixo_open1_string
call print_line

ld b, 10  ;X
ld a, (PIXO_Y)
ld c, a
ld a, 2   ;Cor
ld ix, pixo_open2_string
call print_line

ld a, (PIXO_Y)
;inc a
ld (PIXO_Y), a

pop ix
pop bc
ret

button2_pressed:
push bc
push ix

ld b, 11  ;X
ld a, (PIXO_Y)
ld c, a
ld a, 2   ;Cor
ld ix, pixo_close1_string
call print_line

ld b, 10  ;X
ld a, (PIXO_Y)
ld c, a
ld a, 2   ;Cor
ld ix, pixo_close2_string
call print_line

ld a, (PIXO_Y)
;inc a
ld (PIXO_Y), a

pop ix
pop bc
ret

button3_pressed:
ret

init_video:
ld a, $30 ; enables bg / enables sprites / selects sprite3bank #0
ld (VIDEOCFG), a

ld a, $80 ; unflip screen and enable chars
ld (HWCFG), a

call clear_screen
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Routine to print a line of text at a
;; given screen coordinate
;;
;; INPUTS:
;;
;; A = color
;; B = X coordinate
;; C = Y coordinate
;; IX = pointer to null-terminated string
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_line:
push bc
push de
push iy
push af
push ix

ld d, 0
ld e, c
ld a, 0

sla a
sla e
adc a, d

sla a
sla e
adc a, d

sla a
sla e
adc a, d

sla a
sla e
adc a, d

sla a
sla e
adc a, d

ld d, a
;;DE = 32*Y

push de
push bc

ld iy, VIDEORAM
add iy, de
ld c, b
ld b, 0
add iy, bc
;;IY = videoram_base_address + 32*Y + X

;print some chars there
next_char:
ld a, (ix+0)
inc a
dec a
jp z, finished_printing_line
sub 55
ld (iy+0), a
inc ix
ld bc, 32
add iy, bc
jp next_char
finished_printing_line:

pop bc
pop de
ld iy, COLORRAM
add iy, de
ld c, b
ld b, 0
add iy, bc
;;IY = colorram_base_address + 32*Y + X

pop ix
pop af
push af
ld c, a

;color the chars there
next_char_coloring:
ld a, (ix+0)
inc a
dec a
jp z, finished_coloring_line
ld a, c
ld (iy+0), a
inc ix
push bc
ld bc, 32
add iy, bc
pop bc
jp next_char_coloring
finished_coloring_line:

pop af
pop iy
pop de
pop bc
ret

clear_screen:
push ix
ld ix, COLORRAM
ld b, 0
ld a, CLEAR_COLOR
clear_screen_loop:
ld (ix+0), a
inc ix
ld (ix+0), a
inc ix
ld (ix+0), a
inc ix
ld (ix+0), a
inc ix
djnz clear_screen_loop

pop ix
ret

ghc_string:
db "GAROA HACKER CLUBE", 0

pixotosco_string:
db "PIXOTOSCO", 0

pixo_close1_string:
db "GAM", 0

pixo_close2_string:
db "BBB", 0

pixo_open1_string:
db "TOP", 0

pixo_open2_string:
db "BVI", 0

