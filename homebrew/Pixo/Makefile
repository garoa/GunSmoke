MAME = ~/devel/github_felipesanches/mame_master/mame64
ROMPATH = ~/nonfree/mame
Z80ASSEMBLER = ~/devel/asz80/asxv5pxx/asxmak/linux/build/asz80
Z80COMPILER = sdcc -mz80
OBJCOPY = objcopy
CC = gcc -std=gnu99
PCB_VARIANT = gunsmoke
ROMSET = 3.ic85 \
         gs03.09n \
         gs01.11f \
         gs14.11c \
         g-01.03b \
         g-02.04b \
         g-03.05b \
         gs13.06c \
         gs12.05c \
         gs11.04c \
         gs10.02c \
         gs09.06a \
         gs08.05a \
         gs07.04a \
         gs06.02a

all: $(ROMSET)

run: $(ROMSET)
	$(MAME) -rp $(ROMPATH) $(PCB_VARIANT) -window

debug: $(ROMSET)
	$(MAME) -rp $(ROMPATH) $(PCB_VARIANT) -window -debug

boot.o: boot.s
	$(Z80ASSEMBLER) -o boot.o boot.s

pixo.xpm: pixo.xcf
	xcf2png pixo.xcf -o pixo.png
	convert pixo.png pixo.xpm

pixo_background.xpm: pixo_background.xcf
	xcf2png pixo_background.xcf -o pixo_background.png
	convert pixo_background.png pixo_background.xpm

patch_CGROM: pixo.xpm patch_CGROM.c char_codes.h
	$(CC) patch_CGROM.c -o patch_CGROM

patch_BGROM: pixo_background.xpm patch_BGROM.c
	$(CC) patch_BGROM.c -o patch_BGROM

gs01.11f: patch_CGROM
	cp $(ROMPATH)/gunsmoke/gs01.11f .
	./patch_CGROM
	cp gs01.11f $(ROMPATH)/gunsmoke/

gs14.11c: bg_roms

g-01.03b: bg_roms
g-02.04b: bg_roms
g-03.05b: bg_roms

gs13.06c: bg_roms
gs12.05c: bg_roms
gs11.04c: bg_roms
gs10.02c: bg_roms
gs09.06a: bg_roms
gs08.05a: bg_roms
gs07.04a: bg_roms
gs06.02a: bg_roms

bg_roms: patch_BGROM
	cp $(ROMPATH)/gunsmoke/*.bin .
	./patch_BGROM
	cp $(ROMSET) $(ROMPATH)/gunsmoke/

pixo_maincpu.ihx: pixo_maincpu.c char_codes.h boot.o
	$(Z80COMPILER) boot.o pixo_maincpu.c --code-loc 0x0080 --data-loc 0xE000 --no-std-crt0

3.ic85: pixo_maincpu.ihx
	$(OBJCOPY) pixo_maincpu.ihx -I ihex -O binary 3.ic85
	cp 3.ic85 $(ROMPATH)/gunsmoke

gs03.09n: pixo_maincpu.ihx
	$(OBJCOPY) pixo_maincpu.ihx -I ihex -O binary gs03.09n
	cp 09n_gs03.bin $(ROMPATH)/gunsmoke

clean:
	rm $(ROMSET)
	rm boot.o
	rm patch_CGROM
	rm patch_BGROM
	rm pixo_maincpu.o
	rm pixo_maincpu.ihx
	rm pixo_maincpu.map
	rm pixo_maincpu.sym
	rm pixo_maincpu.lnk
	rm pixo_maincpu.lst
	rm pixo_maincpu.asm
	rm pixo.png
	rm pixo.xpm
	rm pixo_background.png
	rm pixo_background.xpm
	rm gs*.*
	rm g-*.*


