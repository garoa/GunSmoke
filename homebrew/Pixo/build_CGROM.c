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

	save_tile(1, 3, BLANK_CHAR);

	save_tile(0, 0, PIXO_TAIL_E);
	save_tile(1, 0, PIXO_TAIL2_E);
	save_tile(2, 0, PIXO_BODY_E);
	save_tile(3, 0, PIXO_CLOSED_HEAD_E);
	save_tile(4, 0, PIXO_CLOSED_MOUTH_E);
	save_tile(5, 0, PIXO_CLOSED_LIPS_E);

	save_tile(2, 1, PIXO_OPEN_HEAD_E);
	save_tile(3, 1, PIXO_OPEN_MOUTH_E);
	save_tile(4, 1, PIXO_OPEN_LIPS_E);
	save_tile(3, 2, PIXO_OPEN_MOUTH2_E);
	save_tile(4, 2, PIXO_OPEN_LIPS2_E);

	save_tile(4, 3, PIXO_TAIL_S);
	save_tile(4, 4, PIXO_TAIL2_S);
	save_tile(4, 5, PIXO_BODY_S);
	save_tile(4, 6, PIXO_CLOSED_HEAD_S);
	save_tile(4, 7, PIXO_CLOSED_MOUTH_S);
	save_tile(4, 8, PIXO_CLOSED_LIPS_S);

	save_tile(3, 5, PIXO_OPEN_HEAD_S);
	save_tile(3, 6, PIXO_OPEN_MOUTH_S);
	save_tile(3, 7, PIXO_OPEN_LIPS_S);
	save_tile(2, 6, PIXO_OPEN_MOUTH2_S);
	save_tile(2, 7, PIXO_OPEN_LIPS2_S);

	save_tile(5, 7, PIXO_TAIL_N);
	save_tile(5, 6, PIXO_TAIL2_N);
	save_tile(5, 5, PIXO_BODY_N);
	save_tile(5, 4, PIXO_CLOSED_HEAD_N);
	save_tile(5, 3, PIXO_CLOSED_MOUTH_N);
	save_tile(5, 2, PIXO_CLOSED_LIPS_N);

	save_tile(6, 5, PIXO_OPEN_HEAD_N);
	save_tile(6, 4, PIXO_OPEN_MOUTH_N);
	save_tile(6, 3, PIXO_OPEN_LIPS_N);
	save_tile(7, 4, PIXO_OPEN_MOUTH2_N);
	save_tile(7, 3, PIXO_OPEN_LIPS2_N);

	save_tile(11, 2, PIXO_TAIL_W);
	save_tile(10, 2, PIXO_TAIL2_W);
	save_tile(9, 2, PIXO_BODY_W);
	save_tile(8, 2, PIXO_CLOSED_HEAD_W);
	save_tile(7, 2, PIXO_CLOSED_MOUTH_W);
	save_tile(6, 2, PIXO_CLOSED_LIPS_W);

	save_tile(9, 1, PIXO_OPEN_HEAD_W);
	save_tile(8, 1, PIXO_OPEN_MOUTH_W);
	save_tile(7, 1, PIXO_OPEN_LIPS_W);
	save_tile(8, 0, PIXO_OPEN_MOUTH2_W);
	save_tile(7, 0, PIXO_OPEN_LIPS2_W);


	save_tile(0, 1, PIXO_BODY_SW);
	save_tile(0, 4, PIXO_BODY_SE);
	save_tile(2, 4, PIXO_BODY_NE);
	save_tile(2, 2, PIXO_BODY_NW);

	fclose(fp);
	return 0;
}

