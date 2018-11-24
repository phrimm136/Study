#include <stdio.h>

#define CUBE(x) (x * x)
#define REMAINDER(x) (x % 4)
#define CHECK(x, y) ((x < 100) && (y < 0))

int main()
{
	int x = 6, y = -9;
	
	printf("%d %d %d", CUBE(x), REMAINDER(x), CHECK(x, y));
	
	return 0;
}