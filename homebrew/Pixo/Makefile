MAME = ~/devel/mame_git_svn/mame/mame64d
ROMPATH = ~/nonfree/mame/
Z80ASSEMBLER = as-z80
Z80COMPILER = sdcc -mz80
OBJCOPY = objcopy
CC = gcc -std=gnu99
PCB_VARIANT = gunsmokeb

all: 3.ic85 11f_gs01.bin

run: 3.ic85 11f_gs01.bin
	$(MAME) -rp $(ROMPATH) $(PCB_VARIANT) -window

debug: 3.ic85 11f_gs01.bin
	$(MAME) -rp $(ROMPATH) $(PCB_VARIANT) -window -debug

boot.o: boot.s
	$(Z80ASSEMBLER) -o boot.o boot.s

build_CGROM: pixo.xpm build_CGROM.c char_codes.h
	$(CC) build_CGROM.c -o build_CGROM

11f_gs01.bin: build_CGROM
	cp $(ROMPATH)/gunsmoke/11f_gs01.bin .
	./build_CGROM
	cp 11f_gs01.bin $(ROMPATH)/gunsmoke/

pixo_maincpu.ihx: pixo_maincpu.c char_codes.h boot.o
	$(Z80COMPILER) boot.o pixo_maincpu.c --code-loc 0x0080 --data-loc 0xE000 --no-std-crt0

3.ic85: pixo_maincpu.ihx
	$(OBJCOPY) pixo_maincpu.ihx -I ihex -O binary 3.ic85
	cp 3.ic85 $(ROMPATH)/gunsmoke

clean:
	rm boot.o
	rm build_CGROM
	rm 11f_gs01.bin
	rm 3.ic85
	rm pixo_maincpu.o
	rm pixo_maincpu.ihx
	rm pixo_maincpu.map
	rm pixo_maincpu.sym
	rm pixo_maincpu.lnk
	rm pixo_maincpu.lst

