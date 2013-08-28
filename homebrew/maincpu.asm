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
INPUT_MAP: equ $e000
SOUND_ID: equ $e001
vertscroll: equ $e002 ;word

im 1; set interrupt mode = 1
ld sp, $f000 ; init stack pointer (RAM area: e000-efff)
ld a, $ff
ld (INPUT_MAP), a
ld a, NO_SOUND
ld (SOUND_COMMAND), a
call init_video
ld iy, VIDEORAM

infiniteloop:
ei
jr infiniteloop

ds $36, $0 ; fill in a block of NOPs

;;-------------------------------------

call check_user_input
call scroll_vertically
ret

scroll_vertically:
ld ix, vertscroll
ld b, (ix+0)
ld c, (ix+1)
inc bc
inc bc
inc bc
ld a, c
ld (SCROLLX), a
ld a, b
ld (SCROLLX+1), a
ld (ix+0), b
ld (ix+1), c
ret

check_user_input:
ld a, NO_SOUND
ld (SOUND_ID), a
ld a, (P1)
ld b, a
ld a, (INPUT_MAP)
cpl a
xor b

bit 4,a
jp nz, button1_not_pressed
call button1_pressed

button1_not_pressed:
bit 5,a
jp nz, button2_not_pressed
call button2_pressed

button2_not_pressed:
bit 6,a
jp nz, button3_not_pressed
call button3_pressed

button3_not_pressed:
ld a, (SOUND_ID)
ld (SOUND_COMMAND), a
ret

button1_pressed:
push af
ld a, $31
ld (SOUND_ID), a

push bc
push ix

ld a, 5
ld b, 16
ld c, 16
ld ix, example_string
call print_line

ld a, 6
ld b, 5
ld c, 5
ld ix, example_string2
call print_line

pop ix
pop bc

pop af
ret

button2_pressed:
push af
ld a, $32
ld (SOUND_ID), a

call flip2
pop af
ret

button3_pressed:
push af
ld a, $33
ld (SOUND_ID), a

call flip1
pop af
ret

init_video:
ld a, $30 ; enables bg / enables sprites / selects sprite3bank #0
ld (VIDEOCFG), a
call clear_screen
ret

flip1:
ld a, $40 ;flip screen and disable chars
ld (HWCFG), a
ret

flip2:
ld a, $80 ; unflip screen and enable chars
ld (HWCFG), a
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

example_string:
db 10, 12, 14, 11, 13, 15, 0

example_string2:
db "GAROA HACKER CLUBE", 0

