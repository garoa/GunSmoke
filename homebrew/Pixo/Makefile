MAME = ~/devel/github_felipesanches/mame_master/mame64
ROMPATH = ~/nonfree/mame
Z80ASSEMBLER = ~/devel/asz80/asxv5pxx/asxmak/linux/build/asz80
Z80COMPILER = sdcc -mz80
OBJCOPY = objcopy
CC = gcc -std=gnu99
PCB_VARIANT = gunsmoke
ROMSET = 3.ic85 09n_gs03.bin 11f_gs01.bin 11c_gs14.bin 03b_g-01.bin 04b_g-02.bin 05b_g-03.bin 06c_gs13.bin 05c_gs12.bin 04c_gs11.bin 02c_gs10.bin 06a_gs09.bin 05a_gs08.bin 04a_gs07.bin 02a_gs06.bin

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

11f_gs01.bin: patch_CGROM
	cp $(ROMPATH)/gunsmoke/11f_gs01.bin .
	./patch_CGROM
	cp 11f_gs01.bin $(ROMPATH)/gunsmoke/

11c_gs14.bin: bg_roms

03b_g-01.bin: bg_roms
04b_g-02.bin: bg_roms
05b_g-03.bin: bg_roms

06c_gs13.bin: bg_roms
05c_gs12.bin: bg_roms
04c_gs11.bin: bg_roms
02c_gs10.bin: bg_roms
06a_gs09.bin: bg_roms
05a_gs08.bin: bg_roms
04a_gs07.bin: bg_roms
02a_gs06.bin: bg_roms


bg_roms: patch_BGROM
	cp $(ROMPATH)/gunsmoke/*.bin .
	./patch_BGROM
	cp $(ROMSET) $(ROMPATH)/gunsmoke/

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
	rm *.bin


