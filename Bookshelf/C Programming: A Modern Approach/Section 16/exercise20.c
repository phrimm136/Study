#include <stdio.h>

enum {NORTH, SOUTH, EAST, WEST} direction;

int main(void)
{
	int x = 3, y = 4;
	
	direction = WEST;
	
	switch (direction)
	{
		case EAST: x++; break;
		case WEST: x--; break;
		case NORTH: y++; break;
		case SOUTH: y--; break;
	}
	
	printf("%d %d\n", x, y);
	
	return 0;
}