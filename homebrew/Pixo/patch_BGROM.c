#include "pixo_background.xpm"
#include <stdio.h>

#define bool char
#define true 0xFF
#define false 0x00

#define MAX_TILES 512
#define WIDTH 32*8
#define HEIGHT 32*8
#define NUM_COLORS 16
#define xpm_header_offset (1+NUM_COLORS)

struct gfx_layout
{
	int width;              // pixel width of each element
	int height;             // pixel height of each element
	int total;              // total number of elements
	int planes;             // number of bitplanes
	int planeoffset[4]; // bit offset of each bitplane
	int xoffset[32]; // bit offset of each horizontal pixel
	int yoffset[32]; // bit offset of each vertical pixel
	int increment;      // distance between two consecutive elements (in bits)
};

static const struct gfx_layout tilelayout =
{
	32,32,  /* 32*32 tiles */
	512,    /* 512 tiles */
	4,      /* 4 bits per pixel */
	{ 512*256*8+4, 512*256*8+0, 4, 0 },
	{ 0, 1, 2, 3, 8+0, 8+1, 8+2, 8+3,
			64*8+0, 64*8+1, 64*8+2, 64*8+3, 65*8+0, 65*8+1, 65*8+2, 65*8+3,
			128*8+0, 128*8+1, 128*8+2, 128*8+3, 129*8+0, 129*8+1, 129*8+2, 129*8+3,
			192*8+0, 192*8+1, 192*8+2, 192*8+3, 193*8+0, 193*8+1, 193*8+2, 193*8+3 },
	{ 0*16, 1*16, 2*16, 3*16, 4*16, 5*16, 6*16, 7*16,
			8*16, 9*16, 10*16, 11*16, 12*16, 13*16, 14*16, 15*16,
			16*16, 17*16, 18*16, 19*16, 20*16, 21*16, 22*16, 23*16,
			24*16, 25*16, 26*16, 27*16, 28*16, 29*16, 30*16, 31*16 },
	256*8   /* every tile takes 256 consecutive bytes */
};

FILE* tilemap;
FILE* tile_rom_fp[8];
FILE* palette_rom_fp[3];
FILE* tile_pal_rom_fp[2];

unsigned char hex2int(char c){
	if (c >= '0' && c <= '9') return c - '0';
	if (c >= 'a' && c <= 'f') return c - 'a' + 10;
	if (c >= 'A' && c <= 'F') return c - 'A' + 10;
	printf("ERROR: invalid hex number convertion\n");
	return 0;
}

unsigned char xx2value(char* s){
	unsigned char val = (hex2int(s[0])*16 + hex2int(s[1]));
	printf ("%c%c %02x\n", s[0], s[1], val);
	return val;
}

void store_default_16colors_pal(){
	unsigned char value;

	for (int idx=0; idx<16; idx++){
		for (int i=0; i<3; i++){
			//store R, G and B values
			value = (xx2value(&pixo_background[idx+1][5 + 2*i]) >> 4) & 0x0F;
			printf("value=%02x\n", value);
			fseek(palette_rom_fp[i], idx, SEEK_SET);
			fwrite(&value, 1, 1, palette_rom_fp[i]);
		}
	}

	for (int idx=0; idx<16; idx++){
		value = idx;
		fseek(tile_pal_rom_fp[0], idx, SEEK_SET);
		fwrite(&value, 1, 1, tile_pal_rom_fp[0]);

		value = 0;
		fseek(tile_pal_rom_fp[1], idx, SEEK_SET);
		fwrite(&value, 1, 1, tile_pal_rom_fp[1]);
	}
}

int get_color_index(int x, int y, int i, int j){
//Essa era a linha que deveria ser a correta:
//char color_code = pixo_background[xpm_header_offset + y*32 + j][x*32 + i];

//Entretanto tive que fazer uma massagem algébrica gambiarrística pra acertar o posicionamento dos pixels
//Não está claro ainda pra mim por que... Eu gostaria de implementar isso de uma forma mais clara e mais intuitiva:
	char color_code = pixo_background[xpm_header_offset + 255 - (x*32 + (i/4)*4 + 3-(i%4))][y*32 + j]; 


	//find the color index by searching in the XPM palette header
	for (int idx=0; idx<NUM_COLORS; idx++){
		if (color_code == pixo_background[idx+1][0]){
			return idx;
			break;
		}
	}

	return 0; //TODO: indicate error by returning -1.
}


void save_tile_palette(int x, int y){
	char tile_colors_index = 0;
	char tile_colors[16];
	char color_index;

	for (int i=0; i<32; i++){
		for (int j=0; j<32; j++){
			color_index = get_color_index(x,y,i,j);

			//look for color_index in the list of colors we used in this tile up to now
			bool found = false;
			for (int idx=0; idx<tile_colors_index; idx++){
				if (tile_colors[idx] == color_index){
					found = true;
					break;
				}
			}
			if (!found){
				tile_colors[tile_colors_index++] = color_index;
				if (tile_colors_index == 16){
					tile_colors_index--;
					printf("ERROR: exceeded max number of colors in a single background tile.\n");
				}
			}
		}
	}

	//TODO: check if palette has been already used in another tile and reuse it

	//for now we create a single pal for each tile :-P	
//	store_single_tile_pal(...);	
}

void save_tile(int x, int y, int tile_number){
	printf("save_tile x:%d y:%d tile_number:%d\n", x, y, tile_number);

//	save_tile_palette(x, y);

	char color_index;
	char value;

	//store this tile in the tilemap
	value = tile_number;
	fseek(tilemap, (8*x + y)*2, SEEK_SET);
	fwrite(&value, 1, 1, tilemap);

	for (int i=0; i<32; i++){
		for (int j=0; j<32; j++){

			color_index = get_color_index(x,y,i,j);

			for (int bit=0; bit<4; bit++){
				int bit_address = tilelayout.increment * tile_number
                        + tilelayout.planeoffset[bit]
                        + tilelayout.xoffset[i] + tilelayout.yoffset[j];

//				printf("0x%08X 0x%08X [%d]\n", bit_address, bit_address/8, (bit_address/8)/0x8000);
				FILE* fp = tile_rom_fp[(bit_address/8)/0x8000];
				fseek(fp, (bit_address/8)%0x8000, SEEK_SET);
				fread(&value, 1, 1, fp);

				if (color_index & (1<<bit)){
					value |= (1<<(bit_address%8));
				}else{
					value &= ~(1<<(bit_address%8));
				}
				fseek(fp, (bit_address/8)%0x8000, SEEK_SET);
				fwrite(&value, 1, 1, fp);
			}
		}
	}

	int pal_index = 0;

	//TODO: select palette based on colors used
	//and maybe store a new one.

	//store the palette used by this tile
	fseek(tilemap, (8*x + y)*2 + 1, SEEK_SET);
	fread(&value, 1, 1, tilemap);
	value &= ~0x3c;
	value |= pal_index << 2;
	fseek(tilemap, (8*x + y)*2 + 1, SEEK_SET);
	fwrite(&value, 1, 1, tilemap);
}

int calculate_tile_hash(int i, int j){
	//TODO: implement-me!
	static int fake_incremental_hash = 0;
	return fake_incremental_hash++;
}

int main(){
	tilemap = fopen("11c_gs14.bin", "r+");

	tile_rom_fp[0] = fopen("06c_gs13.bin", "r+");
	tile_rom_fp[1] = fopen("05c_gs12.bin", "r+");
	tile_rom_fp[2] = fopen("04c_gs11.bin", "r+");
	tile_rom_fp[3] = fopen("02c_gs10.bin", "r+");
	tile_rom_fp[4] = fopen("06a_gs09.bin", "r+");
	tile_rom_fp[5] = fopen("05a_gs08.bin", "r+");
	tile_rom_fp[6] = fopen("04a_gs07.bin", "r+");
	tile_rom_fp[7] = fopen("02a_gs06.bin", "r+");

	palette_rom_fp[0] = fopen("03b_g-01.bin", "r+");
	palette_rom_fp[1] = fopen("04b_g-02.bin", "r+");
	palette_rom_fp[2] = fopen("05b_g-03.bin", "r+");

	tile_pal_rom_fp[0] = fopen("14a_g-06.bin", "r+");
	tile_pal_rom_fp[1] = fopen("15a_g-07.bin", "r+");

	store_default_16colors_pal();

	int tile_number=0;
	int hash;
	int tile_hashes[MAX_TILES];

	for (int i=0; i<8; i++){
		for (int j=0; j<8; j++){

			hash = calculate_tile_hash(i, j);
			bool found_tile = false;
			for (int k=0; k<tile_number; k++){
				if (hash == tile_hashes[k]){
					found_tile = true;
					break;
				}
			}

			if (!found_tile){
				tile_hashes[tile_number] = hash;
				save_tile(i, j, tile_number++);
			}

			if (tile_number > MAX_TILES){
				fclose(tilemap);
				for (int i=0; i<8; i++)
					fclose(tile_rom_fp[i]);
				for (int i=0; i<2; i++)
					fclose(tile_pal_rom_fp[i]);
				for (int i=0; i<3; i++)
					fclose(palette_rom_fp[i]);
				return -1;
			}
		}
	}

	fclose(tilemap);
	for (int i=0; i<8; i++)
		fclose(tile_rom_fp[i]);
	for (int i=0; i<2; i++)
		fclose(tile_pal_rom_fp[i]);
	for (int i=0; i<3; i++)
		fclose(palette_rom_fp[i]);
	return 0;
}

