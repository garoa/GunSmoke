CURRENT_SONG_PTR: equ $c000
CH1_COUNTER: equ $c002

ORG 0
im 1 ; set interrupt mode = 1
ld sp, $c800 ; init stack pointer (RAM area: c000-c7ff)

call init_song

infiniteloop:
ei
jr infiniteloop

ds $36, $0 ; fill in a block of NOPs

ld de, (CURRENT_SONG_PTR)
ld a, (CH1_COUNTER)
dec a
ld (CH1_COUNTER), a
jp nz, playsound

get_next_note:
ld de, (CURRENT_SONG_PTR)
inc de
inc de
inc de

inc de
inc de
inc de

inc de
inc de
inc de

inc de
inc de
inc de

ld (CURRENT_SONG_PTR), de
ld a, (de)
inc a
dec a
jp z, init_song
ld (CH1_COUNTER), a

playsound:
inc de

ld hl, $e002
ld bc, $e003

ld (hl), $00
ld a, (de)
ld (bc), a
inc de

ld (hl), $01
ld a, (de)
ld (bc), a
inc de

ld (hl), $02
ld a, (de)
ld (bc), a
inc de

ld (hl), $03
ld a, (de)
ld (bc), a
inc de

ld (hl), $04
ld a, (de)
ld (bc), a
inc de

ld (hl), $05
ld a, (de)
ld (bc), a
inc de

ld (hl), $06
ld a, (de)
ld (bc), a
inc de

ld (hl), $07
ld a, (de)
ld (bc), a
inc de

ld (hl), $08
ld a, (de)
ld (bc), a
inc de

ld (hl), $09
ld a, (de)
ld (bc), a
inc de

ld (hl), $0A
ld a, (de)
ld (bc), a

ret

init_song:
ld de, song
ld (CURRENT_SONG_PTR), de
ld a, (de)
ld (CH1_COUNTER), a
ret

TEMPO: EQU $10

song:
db TEMPO
dw C3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw C3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw Bb3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw Bb3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f





db TEMPO
dw C3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw C3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw Bb3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw Bb3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f









db TEMPO
dw F3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw F3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw C4
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw C4
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw D4
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw D4
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw Eb4
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw Eb4
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw D4
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw D4
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw C4
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw C4
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f









db TEMPO
dw C3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw C3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw Bb3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw Bb3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f







db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw B3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw B3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw F4
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw F4
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw E4
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw E4
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw F3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw F3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw Eb4
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw Eb4
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw D4
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw D4
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f







db TEMPO
dw C3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw C3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw E3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw A3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw Bb3
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw Bb3
dw MUTE
dw MUTE
db $00, $f8, $0d, $0f, $0f

db TEMPO
dw G4
dw G5
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G4
dw G5
dw MUTE
db $00, $f8, $0d, $0d, $0f

db TEMPO
dw G4
dw G5
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G4
dw G5
dw MUTE
db $00, $f8, $0d, $0d, $0f

db TEMPO
dw G4
dw G5
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw MUTE
dw MUTE
dw MUTE
db $00, $f8, $0f, $0f, $0f

db TEMPO
dw G4
dw G5
dw MUTE
db $00, $f8, $0d, $0d, $0f

DB 0; end of loop

exemplo_regs:
db $00 ; período da nota
db $c0, $02 ;periodo canal A
db $00, $00 ;periodo canal B
db $00, $00 ;periodo canal C
db $00 ;frequencia do gerador de ruído
db $f8 ; seletor de ruido / tom pra cada canal
db $0f, $0d, $0d ; volume dos canais A, B e C

CLOCK_FREQ: equ 1500000/16
MUTE: equ 0
C0: equ 100*CLOCK_FREQ/1635
D0: equ 100*CLOCK_FREQ/1835
Eb0: equ 100*CLOCK_FREQ/1945
E0: equ 100*CLOCK_FREQ/2060
F0: equ 100*CLOCK_FREQ/2183
G0: equ 100*CLOCK_FREQ/2450
A0: equ 100*CLOCK_FREQ/2750
Bb0: equ 100*CLOCK_FREQ/2914
B0: equ 100*CLOCK_FREQ/3087
C1: equ C0/2
D1: equ D0/2
Eb1: equ Eb0/2
E1: equ E0/2
F1: equ F0/2
G1: equ G0/2
A1: equ A0/2
Bb1: equ Bb0/2
B1: equ B0/2
C2: equ C1/2
D2: equ D1/2
Eb2: equ Eb1/2
E2: equ E1/2
F2: equ F1/2
G2: equ G1/2
A2: equ A1/2
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

