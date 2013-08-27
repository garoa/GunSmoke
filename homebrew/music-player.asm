;music player for the GunSmoke arcade hardware
; It uses 2 ay-3-8910 chips to play up to 6 simultaneous audio tracks
;
;author: Felipe Sanches <juca@members.fsf.org>
;year: 2013
;This code is released to the public domain

NOTE_PTRs: equ $c000
CH1_NOTE_PTR: equ $c000
CH2_NOTE_PTR: equ $c002
CH3_NOTE_PTR: equ $c004
CH4_NOTE_PTR: equ $c006
CH5_NOTE_PTR: equ $c008
CH6_NOTE_PTR: equ $c00a

CHANNEL_COUNTERs: equ $c00c
CH1_COUNTER: equ $c00c
CH2_COUNTER: equ $c00d
CH3_COUNTER: equ $c00e
CH4_COUNTER: equ $c00f
CH5_COUNTER: equ $c010
CH6_COUNTER: equ $c011

SOUND_COMMAND: equ $c800

im 1 ; set interrupt mode = 1
ld sp, $c800 ; init stack pointer (RAM area: c000-c7ff)

call init_channels

infiniteloop:
ei
jr infiniteloop

ds $36, $0 ; fill in a block of NOPs

ld a, (SOUND_COMMAND)
cp $FF
jp z, play_all_channels

call setup_new_sound

play_all_channels:
ld b, 6
play_next_channel:
call play_channel
djnz play_next_channel
ret


;;;;;;;;;;;;
;; detects which channel is free to use for playing a sound
;; requested by the main CPU
;;
;; inputs:
;; a = sound command received from the main Z80 CPU
;;;;;;;;;;;;
setup_new_sound:
push af
ld b, 6
ld ix, CHANNEL_COUNTERs
check_channel_availability:
ld a, (ix+5)
dec ix
inc a
dec a
jp z, found_a_free_channel
djnz check_channel_availability

found_a_free_channel:
pop af

; TODO: use the value in the A reg to select which sound to play
; for now we simply play again the blues tune

dec b
ld c, b
ld b, 0
ld ix, NOTE_PTRs
ld iy, CHANNEL_COUNTERs
ld de, fast_beeps
add ix, bc
add ix, bc
ld (ix + 1), d
ld (ix + 0), e
ld a, (de)
add iy, bc
ld (iy + 0), a

ret

;;;;;;;;;;;;
;; b = channel number
;;;;;;;;;;;;
play_channel:
push bc

dec b
ld c, b
ld b, 0
ld ix, NOTE_PTRs
add ix, bc
add ix, bc

ld iy, CHANNEL_COUNTERs
add iy, bc

ld d, (ix+1)
ld e, (ix+0)
ld a, (iy+0)
inc a
dec a
jp z, goto_next_channel

dec a
ld (iy+0), a
jp z, get_next_note
call playsound
pop bc
ret

get_next_note:
ld d, (ix+1)
ld e, (ix+0)

inc de
inc de
inc de
inc de

ld (ix+1), d
ld (ix+0), e
ld a, (de)
inc a
dec a
jp z, goto_next_channel
ld (iy+0), a
call playsound

goto_next_channel:
pop bc
ret

playsound:
inc de

ld a, c
cp 3
jp nc, second_sound_chip

first_sound_chip:
ld hl, $e000
ld bc, $e001
jp after_sound_chip_selection

second_sound_chip:
sub 3
ld hl, $e002
ld bc, $e003

after_sound_chip_selection:
push af

sla a
;channel period (coarse tune):
ld (hl), a
ld a, (de)
ld (bc), a
inc de

pop af
push af

sla a
inc a
;channel period (fine tune):
ld (hl), a
ld a, (de)
ld (bc), a
inc de

pop af
push af

;channel amplitude
add $08
ld (hl), a
ld a, (de)
ld (bc), a
inc de

; noise period
ld (hl), $06
ld a, $0
ld (bc), a ; no noise

;Mixer Control-I/O Enable
ld (hl), $07
ld a, $f8
ld (bc), a ; disable all noise / enable all tone

pop af
ret

init_channels:
ld de, no_song
ld (CH1_NOTE_PTR), de
ld a, (de)
ld (CH1_COUNTER), a

ld de, no_song
ld (CH2_NOTE_PTR), de
ld a, (de)
ld (CH2_COUNTER), a

ld de, no_song
ld (CH3_NOTE_PTR), de
ld a, (de)
ld (CH3_COUNTER), a

ld de, no_song
ld (CH4_NOTE_PTR), de
ld a, (de)
ld (CH4_COUNTER), a

ld de, no_song
ld (CH5_NOTE_PTR), de
ld a, (de)
ld (CH5_COUNTER), a

ld de, no_song
ld (CH6_NOTE_PTR), de
ld a, (de)
ld (CH6_COUNTER), a
ret

TEMPO: EQU $38

blues_piano:
db TEMPO
dw MUTE
db $00

db TEMPO
dw Eb4
db $0f

db TEMPO
dw E4
db $0f

db TEMPO
dw G4
db $0f

db TEMPO
dw Bb4
db $0f

db TEMPO
dw C5
db $0f

db TEMPO
dw MUTE
db $00

db TEMPO
dw Eb4
db $0f

db TEMPO
dw E4
db $0f

db TEMPO
dw G4
db $0f

db TEMPO
dw Bb4
db $0f

db TEMPO
dw C5
db $0f

db TEMPO
dw MUTE
db $00

db 0

fast_beeps:
db 10
dw C3
db $0f

db 10
dw C4
db $0f

db 10
dw C5
db $0f

db 10
dw C4
db $0f

db 10
dw MUTE
db $0f

db 0

blues_bass:
db TEMPO
dw C3
db $0f

db TEMPO
dw MUTE
db $0f

db TEMPO
dw C3
db $0d

db TEMPO
dw E3
db $0f

db TEMPO
dw MUTE
db $0f

db TEMPO
dw E3
db $0d

db TEMPO
dw G3
db $0f

db TEMPO
dw MUTE
db $0f

db TEMPO
dw G3
db $0d

db TEMPO
dw A3
db $0f

db TEMPO
dw MUTE
db $0f

db TEMPO
dw A3
db $0d

db TEMPO
dw Bb3
db $0f

db TEMPO
dw MUTE
db $0f

db TEMPO
dw Bb3
db $0d

db TEMPO
dw A3
db $0f

db TEMPO
dw MUTE
db $0f

db TEMPO
dw A3
db $0d

db TEMPO
dw G3
db $0f

db TEMPO
dw MUTE
db $0f

db TEMPO
dw G3
db $0d

db TEMPO
dw E3
db $0f

db TEMPO
dw MUTE
db $0f

db TEMPO
dw E3
db $0d

db TEMPO
dw C3
db $0f

db TEMPO
dw MUTE
db $0f

db 0

no_song:
db 0

CLOCK_FREQ: equ 1500000/16
MUTE: equ 0
C0: equ 100*CLOCK_FREQ/1635
Csharp0: equ 100*CLOCK_FREQ/1732
Db0: equ Csharp0
D0: equ 100*CLOCK_FREQ/1835
Dsharp0: equ 100*CLOCK_FREQ/1945
Eb0: equ Dsharp0
E0: equ 100*CLOCK_FREQ/2060
F0: equ 100*CLOCK_FREQ/2183
Fsharp0: equ 100*CLOCK_FREQ/2312
Gb0: equ Fsharp0
G0: equ 100*CLOCK_FREQ/2450
Gsharp0: equ 100*CLOCK_FREQ/2596
Ab0: equ Gsharp0
A0: equ 100*CLOCK_FREQ/2750
Asharp0: equ 100*CLOCK_FREQ/2914
Bb0: equ Asharp0
B0: equ 100*CLOCK_FREQ/3087
C1: equ C0/2
Csharp1: equ Csharp0/2
Db1: equ Db0/2
D1: equ D0/2
Dsharp1: equ Dsharp0/2
Eb1: equ Eb0/2
E1: equ E0/2
F1: equ F0/2
Fsharp1: equ Fsharp0/2
Gb1: equ Gb0/2
G1: equ G0/2
Gsharp1: equ Gsharp0/2
Ab1: equ Ab0/2
A1: equ A0/2
Asharp1: equ Asharp0/2
Bb1: equ Bb0/2
B1: equ B0/2
C2: equ C1/2
Csharp2: equ Csharp1/2
Db2: equ Db1/2
D2: equ D1/2
Dsharp2: equ Dsharp1/2
Eb2: equ Eb1/2
E2: equ E1/2
F2: equ F1/2
Fsharp2: equ Fsharp1/2
Gb2: equ Gb1/2
G2: equ G1/2
Gsharp2: equ Gsharp1/2
Ab2: equ Ab1/2
A2: equ A1/2
Asharp2: equ Asharp1/2
Bb2: equ Bb1/2
B2: equ B1/2
C3: equ C2/2
D3: equ D2/2
Eb3: equ Eb2/2
E3: equ E2/2
F3: equ F2/2
G3: equ G2/2
A3: equ A2/2
Bb3: equ Bb2/2
B3: equ B2/2
C4: equ C3/2
D4: equ D3/2
Eb4: equ Eb3/2
E4: equ E3/2
F4: equ F3/2
G4: equ G3/2
A4: equ A3/2
Bb4: equ Bb3/2
B4: equ B3/2
C5: equ C4/2
D5: equ D4/2
Eb5: equ Eb4/2
E5: equ E4/2
F5: equ F4/2
G5: equ G4/2
A5: equ A4/2
Bb5: equ Bb4/2
B5: equ B4/2

