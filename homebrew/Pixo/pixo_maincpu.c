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

void draw_head_open(int x, int y){
	set_char(x, y,   PIXO_OPEN_LIPS_E,  BODY_COLOR);
	set_char(x, y-1, PIXO_OPEN_MOUTH_E, BODY_COLOR);
	set_char(x, y-2, PIXO_OPEN_HEAD_E,  BODY_COLOR);
	set_char(x, y-3, PIXO_BODY_E,       BODY_COLOR);

	set_char(x-1, y,   PIXO_OPEN_LIPS2_E,  BODY_COLOR);
	set_char(x-1, y-1, PIXO_OPEN_MOUTH2_E, BODY_COLOR);

//This blank char is meant to gradually clear the screen as
// the aligator moves forward
//TODO: we should somehow redraw here what was previously drawn on screen
	set_char(x-1, y-2, BLANK_CHAR,         BODY_COLOR);
}

void draw_head_closed(int x, int y){
	set_char(x, y,   PIXO_CLOSED_LIPS_E,  BODY_COLOR);
	set_char(x, y-1, PIXO_CLOSED_MOUTH_E, BODY_COLOR);
	set_char(x, y-2, PIXO_CLOSED_HEAD_E,  BODY_COLOR);
	set_char(x, y-3, PIXO_BODY_E,       BODY_COLOR);

//These blank chars are meant to clear the previously opened mouth chars
//TODO: we should somehow redraw here what was previously drawn on screen
	set_char(x-1, y,   BLANK_CHAR, BODY_COLOR);
	set_char(x-1, y-1, BLANK_CHAR, BODY_COLOR);
	set_char(x-1, y-2, BLANK_CHAR, BODY_COLOR);
	set_char(x-1, y-3, BLANK_CHAR, BODY_COLOR);
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

void button_right_pressed(){
	direction = DIR_EAST;
}

void button_left_pressed(){
	direction = DIR_WEST;
}

void button_up_pressed(){
	direction = DIR_NORTH;
}

void button_down_pressed(){
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


