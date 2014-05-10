/*
author: Felipe Sanches <juca@members.fsf.org>
year: 2014
This code is released to the public domain
*/

#include "char_codes.h"

#define SYSTEM ((char*) 0xC000)
#define P1 ((char*) 0xC001)
#define P2 ((char*) 0xC002)
#define DSW1 ((char*) 0xC003)
#define DSW2 ((char*) 0xC004)
#define SOUND_COMMAND ((char*) 0xC800)
#define HWCFG ((char*) 0xC804)
#define VIDEORAM ((char*) 0xD000) //videoram area: D000-D3FF
#define COLORRAM ((char*) 0xD400) //videoram area: D400-D7FF
#define SCROLLX ((char*) 0xD800)
#define SCROLLY ((char*) 0xD802)
#define VIDEOCFG ((char*) 0xD806)
#define SPRITERAM ((char*) 0xF000) //spriteram area: F000-FFFF

#define CLEAR_COLOR 0x80 //why?!
#define NO_SOUND 0xff

#define bool char
#define true 0xFF
#define false 0x00

int mainloop_counter;
char input_map;
char pixo_x, pixo_y;
char direction;
char state;

enum {
	DIR_NORTH,
	DIR_SOUTH,
	DIR_EAST,
	DIR_WEST
};

enum {
	OPENED_MOUTH,
	CLOSED_MOUTH
};

//routine for placing a character on screen
void set_char(int x, int y, char char_code, char color){
	*(COLORRAM + 32*y + x) = color;
	*(VIDEORAM + 32*y + x) = char_code;
}

// Routine to print a line of text at a
// given screen coordinate
void print_line(char* str, int x, int y, char color){
	char* ptr = str;
	while (*ptr != 0){
		set_char(x, y++, *(ptr++) - 55, color);
	}
}

void clear_screen(){
	int i;
	for (i=0; i<1024; i++)
		*(COLORRAM+i) = CLEAR_COLOR;
}

#define BODY_COLOR 6

void draw_head_closed_north(int x, int y){
	set_char(x+2, y, PIXO_CLOSED_LIPS_N,  BODY_COLOR);
	set_char(x+1, y, PIXO_CLOSED_MOUTH_N, BODY_COLOR);
	set_char(x,   y, PIXO_CLOSED_HEAD_N,  BODY_COLOR);
	set_char(x-1, y, PIXO_BODY_N,         BODY_COLOR);

//This blank char is meant to gradually clear the screen as
// the aligator moves forward
//TODO: we should somehow redraw here what was previously drawn on screen
	set_char(x+1, y+1, BLANK_CHAR,         BODY_COLOR);
	set_char(x,   y+1, BLANK_CHAR,         BODY_COLOR);
}

void draw_head_closed_south(int x, int y){
	set_char(x-2, y, PIXO_CLOSED_LIPS_S,  BODY_COLOR);
	set_char(x-1, y, PIXO_CLOSED_MOUTH_S, BODY_COLOR);
	set_char(  x, y, PIXO_CLOSED_HEAD_S,  BODY_COLOR);
	set_char(x+1, y, PIXO_BODY_S,         BODY_COLOR);

//This blank char is meant to gradually clear the screen as
// the aligator moves forward
//TODO: we should somehow redraw here what was previously drawn on screen
	set_char(x-1, y-1, BLANK_CHAR,         BODY_COLOR);
	set_char(  x, y-1, BLANK_CHAR,         BODY_COLOR);
}

void draw_head_closed_east(int x, int y){
	set_char(x, y+2,   PIXO_CLOSED_LIPS_E,  BODY_COLOR);
	set_char(x, y+1, PIXO_CLOSED_MOUTH_E, BODY_COLOR);
	set_char(x, y, PIXO_CLOSED_HEAD_E,  BODY_COLOR);
	set_char(x, y-1, PIXO_BODY_E,       BODY_COLOR);

//This blank char is meant to gradually clear the screen as
// the aligator moves forward
//TODO: we should somehow redraw here what was previously drawn on screen
	set_char(x-1, y, BLANK_CHAR,         BODY_COLOR);
	set_char(x-1, y+1, BLANK_CHAR,         BODY_COLOR);
}

void draw_head_closed_west(int x, int y){
	set_char(x, y-2,   PIXO_CLOSED_LIPS_W,  BODY_COLOR);
	set_char(x, y-1, PIXO_CLOSED_MOUTH_W, BODY_COLOR);
	set_char(x, y, PIXO_CLOSED_HEAD_W,  BODY_COLOR);
	set_char(x, y+1, PIXO_BODY_W,       BODY_COLOR);

//This blank char is meant to gradually clear the screen as
// the aligator moves forward
//TODO: we should somehow redraw here what was previously drawn on screen
	set_char(x+1, y-1, BLANK_CHAR,         BODY_COLOR);
	set_char(x+1, y, BLANK_CHAR,         BODY_COLOR);
}

void draw_head_open_north(int x, int y){
	set_char(x+2, y, PIXO_OPEN_LIPS_N,  BODY_COLOR);
	set_char(x+1, y, PIXO_OPEN_MOUTH_N, BODY_COLOR);
	set_char(  x, y, PIXO_OPEN_HEAD_N,  BODY_COLOR);
	set_char(x-1, y, PIXO_BODY_N,       BODY_COLOR);

	set_char(x+2, y+1, PIXO_OPEN_LIPS2_N,  BODY_COLOR);
	set_char(x+1, y+1, PIXO_OPEN_MOUTH2_N, BODY_COLOR);
}

void draw_head_open_south(int x, int y){
	set_char(x-2, y,   PIXO_OPEN_LIPS_S,  BODY_COLOR);
	set_char(x-1, y, PIXO_OPEN_MOUTH_S, BODY_COLOR);
	set_char(  x, y, PIXO_OPEN_HEAD_S,  BODY_COLOR);
	set_char(x+1, y, PIXO_BODY_S,       BODY_COLOR);

	set_char(x-2, y-1,   PIXO_OPEN_LIPS2_S,  BODY_COLOR);
	set_char(x-1, y-1, PIXO_OPEN_MOUTH2_S, BODY_COLOR);
}

void draw_head_open_west(int x, int y){
	set_char(x, y-2, PIXO_OPEN_LIPS_W,  BODY_COLOR);
	set_char(x, y-1, PIXO_OPEN_MOUTH_W, BODY_COLOR);
	set_char(x, y, PIXO_OPEN_HEAD_W,  BODY_COLOR);
	set_char(x, y+1, PIXO_BODY_W,       BODY_COLOR);

	set_char(x+1, y-2,   PIXO_OPEN_LIPS2_W,  BODY_COLOR);
	set_char(x+1, y-1, PIXO_OPEN_MOUTH2_W, BODY_COLOR);
}

void draw_head_open_east(int x, int y){
	set_char(x, y+2,   PIXO_OPEN_LIPS_E,  BODY_COLOR);
	set_char(x, y+1, PIXO_OPEN_MOUTH_E, BODY_COLOR);
	set_char(x, y, PIXO_OPEN_HEAD_E,  BODY_COLOR);
	set_char(x, y-1, PIXO_BODY_E,       BODY_COLOR);

	set_char(x-1, y+2,   PIXO_OPEN_LIPS2_E,  BODY_COLOR);
	set_char(x-1, y+1, PIXO_OPEN_MOUTH2_E, BODY_COLOR);
}

void draw_head_open(int x, int y){
	switch (direction){
		case DIR_NORTH:	draw_head_open_north(x, y); break;
		case DIR_SOUTH:	draw_head_open_south(x, y); break;
		case DIR_EAST:	draw_head_open_east(x, y); break;
		case DIR_WEST:	draw_head_open_west(x, y); break;
	}
}

void draw_head_closed(int x, int y){
	switch (direction){
		case DIR_NORTH:	draw_head_closed_north(x, y); break;
		case DIR_SOUTH:	draw_head_closed_south(x, y); break;
		case DIR_EAST:	draw_head_closed_east(x, y); break;
		case DIR_WEST:	draw_head_closed_west(x, y); break;
	}
}

void init_video(){
	*VIDEOCFG = 0x30; // enables bg / enables sprites / selects sprite3bank #0
	*HWCFG = 0x80; // unflip screen and enable chars

	clear_screen();
}

void init_system(){
	*SOUND_COMMAND = NO_SOUND;
	mainloop_counter = 0;
	input_map = 0xFF;
	pixo_x = 8;
	pixo_y = 8;
	direction = DIR_NORTH;
	state = CLOSED_MOUTH;

	init_video();

	while(true) {
	__asm
    ei
  __endasm;
	}
}

void erase_mouth_when_turning(){
	int x=pixo_x, y=pixo_y;
	switch(direction){
		case DIR_NORTH:
			set_char(x+2,   y, BLANK_CHAR, BODY_COLOR);
			set_char(x+1,   y, BLANK_CHAR, BODY_COLOR);
			set_char(x+2, y+1, BLANK_CHAR, BODY_COLOR);
			set_char(x+1, y+1, BLANK_CHAR, BODY_COLOR);
			break;
		case DIR_SOUTH:
			set_char(x-1,   y, BLANK_CHAR, BODY_COLOR);
			set_char(x-2,   y, BLANK_CHAR, BODY_COLOR);
			set_char(x-1, y-1, BLANK_CHAR, BODY_COLOR);
			set_char(x-2, y-1, BLANK_CHAR, BODY_COLOR);
			break;
		case DIR_EAST:
			set_char(  x, y+1, BLANK_CHAR, BODY_COLOR);
			set_char(  x, y+2, BLANK_CHAR, BODY_COLOR);
			set_char(x-1, y+1, BLANK_CHAR, BODY_COLOR);
			set_char(x-1, y+2, BLANK_CHAR, BODY_COLOR);
			break;
		case DIR_WEST:
			set_char(  x, y-1, BLANK_CHAR, BODY_COLOR);
			set_char(x+1, y-1, BLANK_CHAR, BODY_COLOR);
			set_char(  x, y-2, BLANK_CHAR, BODY_COLOR);
			set_char(x+1, y-2, BLANK_CHAR, BODY_COLOR);
			break;
	}
}

void button_right_pressed(){
	if (direction != DIR_EAST)	erase_mouth_when_turning();
	direction = DIR_EAST;
}

void button_left_pressed(){
	if (direction != DIR_WEST)	erase_mouth_when_turning();
	direction = DIR_WEST;
}

void button_up_pressed(){
	if (direction != DIR_NORTH)	erase_mouth_when_turning();
	direction = DIR_NORTH;
}

void button_down_pressed(){
	if (direction != DIR_SOUTH)	erase_mouth_when_turning();
	direction = DIR_SOUTH;
}

void check_user_input(){
	char a = ~input_map ^ *P1;

	if ((a & (1 << 0))==0){
		button_right_pressed();
		return;
	}

	if ((a & (1 << 1))==0){
		button_left_pressed();
		return;
	}

	if ((a & (1 << 2))==0){
		button_down_pressed();
		return;
	}

	if ((a & (1 << 3))==0){
		button_up_pressed();
		return;
	}
}

void move_pixotosco(){
	switch(direction){
		case DIR_NORTH: pixo_x++; break;
		case DIR_SOUTH: pixo_x--; break;
		case DIR_EAST: pixo_y++; break;
		case DIR_WEST: pixo_y--; break;
	}
}

void	draw_pixotosco(){
	if (state == OPENED_MOUTH)
		draw_head_open(pixo_x, pixo_y);
	else //if (state == CLOSED_MOUTH)
		draw_head_closed(pixo_x, pixo_y);
}

void toggle_pixotosco_mouth_state(){
	if (state == OPENED_MOUTH){
		state = CLOSED_MOUTH;
	} else {
		state = OPENED_MOUTH;
	}
}

void game_tick(){
	toggle_pixotosco_mouth_state();
	move_pixotosco();
	draw_pixotosco();
}

void main_loop(){
	check_user_input();

	mainloop_counter++;
	if (mainloop_counter > 10){
		game_tick();
		mainloop_counter = 0;
	}
}


