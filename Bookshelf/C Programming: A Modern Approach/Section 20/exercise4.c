#include <stdio.h>

#define MK_COLOR(red, green, blue) ((red)|((green)<<8)|((blue)<<16))

int main(void)
{
	unsigned long color = 0;
	
	color = MK_COLOR(12, 34, 56);
	printf("Red: %d, Green: %d, Blue: %d",
			color & 0x000000FF, color >> 8 & 0x000000FF, color >> 16 & 0x000000FF);
	
	return 0;
}