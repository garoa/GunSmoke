all: 3.ic85 11f_gs01.bin

run: 3.ic85 11f_gs01.bin
	~/devel/mame_git_svn/mame/mame64d -rp ~/nonfree/mame/ gunsmokeb -window

debug: 3.ic85 11f_gs01.bin
	~/devel/mame_git_svn/mame/mame64d -rp ~/nonfree/mame/ gunsmokeb -window -debug

boot.o: boot.s
	as-z80 -o boot.o boot.s

build_CGROM: pixo.xpm build_CGROM.c
	gcc build_CGROM.c -o build_CGROM -std=gnu99

11f_gs01.bin: build_CGROM
	cp ~/nonfree/mame/gunsmoke/11f_gs01.bin .
	./build_CGROM
	cp 11f_gs01.bin ~/nonfree/mame/gunsmoke/

pixo_maincpu.ihx: pixo_maincpu.c boot.o
	sdcc boot.o pixo_maincpu.c -mz80 --code-loc 0x0080 --data-loc 0xE000 --no-std-crt0

3.ic85: pixo_maincpu.ihx
	objcopy pixo_maincpu.ihx -I ihex -O binary 3.ic85
	cp 3.ic85 ~/nonfree/mame/gunsmoke

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

