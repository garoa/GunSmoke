#include "pixo.xpm"
#include <stdio.h>

#define WIDTH 320
FILE *fp;

void save_tile(int x, int y, int tile_number){
	int address = 16 * tile_number;

	fseek(fp, address, SEEK_SET);
	for (int i=0; i<8; i++){
		char value = 0;
		for (int j=0; j<4; j++){
			if(pixo_xpm[4 + y*8 + 7 - j - 4][x*8 + 7 - i] == '+')
				value += (0b10001 << j);
		}
		fwrite(&value, 1, 1, fp);

		value = 0;
		for (int j=0; j<4; j++){
			if(pixo_xpm[4 + y*8 + 7 - j][x*8 + 7 - i] == '+')
				value += (0b10001 << j);
		}
		fwrite(&value, 1, 1, fp);
	}
}

int main(){
	fp = fopen("11f_gs01.bin", "r+");

	save_tile(2, 0, 'C'-55);
	save_tile(3, 0, 'G'-55);
	save_tile(4, 0, 'A'-55);
	save_tile(5, 0, 'M'-55);

	save_tile(2, 1, 'T'-55);
	save_tile(3, 1, 'O'-55);
	save_tile(4, 1, 'P'-55);
	save_tile(2, 2, 'B'-55);
	save_tile(3, 2, 'V'-55);
	save_tile(4, 2, 'I'-55);

	fclose(fp);
	return 0;
}
