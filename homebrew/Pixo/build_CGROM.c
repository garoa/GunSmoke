#include "pixo.xpm"
#include "char_codes.h"
#include <stdio.h>

#define WIDTH 320
FILE *fp;

void save_tile(int x, int y, int tile_number){
	int address = 16 * tile_number;

	fseek(fp, address, SEEK_SET);
	for (int i=0; i<8; i++){
		char value = 0;
		for (int j=0; j<4; j++){
			if(pixo[4 + y*8 + 7 - j - 4][x*8 + 7 - i] == ' ')
				value += (0b10001 << j);
		}
		fwrite(&value, 1, 1, fp);

		value = 0;
		for (int j=0; j<4; j++){
			if(pixo[4 + y*8 + 7 - j][x*8 + 7 - i] == ' ')
				value += (0b10001 << j);
		}
		fwrite(&value, 1, 1, fp);
	}
}

int main(){
	fp = fopen("11f_gs01.bin", "r+");

	save_tile(2, 0, PIXO_BODY_E);
	save_tile(3, 0, PIXO_CLOSED_HEAD_E);
	save_tile(4, 0, PIXO_CLOSED_MOUTH_E);
	save_tile(5, 0, PIXO_CLOSED_LIPS_E);

	save_tile(2, 1, PIXO_OPEN_HEAD_E);
	save_tile(3, 1, PIXO_OPEN_MOUTH_E);
	save_tile(4, 1, PIXO_OPEN_LIPS_E);
	save_tile(2, 2, BLANK_CHAR);
	save_tile(3, 2, PIXO_OPEN_MOUTH2_E);
	save_tile(4, 2, PIXO_OPEN_LIPS2_E);

	fclose(fp);
	return 0;
}

