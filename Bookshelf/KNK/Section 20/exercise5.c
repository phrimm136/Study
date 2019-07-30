#include <stdio.h>

#define MK_COLOR(red, green, blue) ((red)|((green)<<8)|((blue)<<16))
#define GET_RED(color) ((color)&0x000000FF)
#define GET_GREEN(color) ((color)>>8&0x000000FF)
#define GET_BLUE(color) ((color)>>16&0x000000FF)

int main(void)
{
	unsigned long color = 0;
	
	color = MK_COLOR(12, 34, 56);
	printf("Red: %d, Green: %d, Blue: %d",
			GET_RED(color), GET_GREEN(color), GET_BLUE(color));
	
	return 0;
}