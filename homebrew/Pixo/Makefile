MAME = ~/devel/mame_git_svn/mame/mame64d
ROMPATH = ~/nonfree/mame/
Z80ASSEMBLER = as-z80
Z80COMPILER = sdcc -mz80
OBJCOPY = objcopy
CC = gcc -std=gnu99
PCB_VARIANT = gunsmokeb
ROMSET = 3.ic85 09n_gs03.bin 11f_gs01.bin

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

patch_CGROM: pixo.xpm patch_CGROM.c char_codes.h
	$(CC) patch_CGROM.c -o patch_CGROM

11f_gs01.bin: patch_CGROM
	cp $(ROMPATH)/gunsmoke/11f_gs01.bin .
	./patch_CGROM
	cp 11f_gs01.bin $(ROMPATH)/gunsmoke/

pixo_maincpu.ihx: pixo_maincpu.c char_codes.h boot.o
	$(Z80COMPILER) boot.o pixo_maincpu.c --code-loc 0x0080 --data-loc 0xE000 --no-std-crt0

3.ic85: pixo_maincpu.ihx
	$(OBJCOPY) pixo_maincpu.ihx -I ihex -O binary 3.ic85
	cp 3.ic85 $(ROMPATH)/gunsmoke

09n_gs03.bin: pixo_maincpu.ihx
	$(OBJCOPY) pixo_maincpu.ihx -I ihex -O binary 09n_gs03.bin
	cp 09n_gs03.bin $(ROMPATH)/gunsmoke

clean:
	rm $(ROMSET)
	rm boot.o
	rm patch_CGROM
	rm pixo_maincpu.o
	rm pixo_maincpu.ihx
	rm pixo_maincpu.map
	rm pixo_maincpu.sym
	rm pixo_maincpu.lnk
	rm pixo_maincpu.lst
	rm pixo_maincpu.asm
	rm pixo.png
	rm pixo.xpm


