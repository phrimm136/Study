#include <stdio.h>

struct color {int red, green, blue;};

int main(void)
{
	struct color magenta = {255, 0, 255};
	
	printf("%d %d %d\n", magenta.red, magenta.green, magenta.blue);
	
	struct color MAGENTA = {.red = 255, .green = 0, .blue = 255};
	printf("%d %d %d\n", MAGENTA.red, MAGENTA.green, MAGENTA.blue);
	
	return 0;
}