all: 3.ic85 11f_gs01.bin

run: 3.ic85 11f_gs01.bin
	~/devel/mame_git_svn/mame/mame64d -rp ~/nonfree/mame/ gunsmokeb -window

build_CGROM: pixo.xpm build_CGROM.c
	gcc build_CGROM.c -o build_CGROM -std=gnu99

11f_gs01.bin: build_CGROM
	cp ~/nonfree/mame/gunsmoke/11f_gs01.bin .
	./build_CGROM
	cp 11f_gs01.bin ~/nonfree/mame/gunsmoke/
	

3.ic85: maincpu.asm
	~/devel/z80asm/z80asm maincpu.asm -o 3.ic85
	cp 3.ic85 ~/nonfree/mame/gunsmoke

clean:
	rm 3.ic85
	rm 11f_gs01.bin

