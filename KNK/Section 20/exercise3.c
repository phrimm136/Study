#include <stdio.h>

#define M(x, y) ((x)^=(y),(y)^=(x),(x)^=(y)) // swap each other

int main(void)
{
	unsigned short i, j;
	
	i = 15, j = 7;
	
	M(i, j);
	printf("%d %d", i, j);
	
	return 0;
}