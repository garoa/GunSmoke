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
SCROLLX: equ $d800
SCROLLY: equ $d802
VIDEOCFG: equ $d806

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

infiniteloop:
ei
jr infiniteloop

ds $36, $0 ; fill in a block of NOPs

;;-------------------------------------

call check_user_input
call scroll_vertically
ld ix, VIDEORAM
ret

scroll_vertically:
ld ix, vertscroll
ld b, (ix+0)
ld c, (ix+1)
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

call random_tiles
pop af
ret

button2_pressed:
push af
ld a, $32
ld (SOUND_ID), a

call random_tiles
call flip2
pop af
ret

button3_pressed:
push af
ld a, $33
ld (SOUND_ID), a

call random_tiles
call flip1
pop af
ret

init_video:
ld a, $30 ; enables bg / enables sprites / selects sprite3bank #0
ld (VIDEOCFG), a
ret

flip1:
ld a, $40 ;flips screen
ld (HWCFG), a
ret

flip2:
ld a, $0 ;flips screen
ld (HWCFG), a
ret

;this is a test. I'm trying to understand how the videoram works, So I'm trowing values when I press the buttons.
;I was expecting to see random sprites on the screen, but for some reason nothing shows up.
random_tiles:
ld (ix+0), a
inc ix

ld a, $3c
ld (ix+0), a
inc ix
ret
