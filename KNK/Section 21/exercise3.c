#include <stdio.h>

int add(int x, int y);

#define add(x, y) ((x)*(y))

int main(void)
{
	printf("%d", add(2, 3));
	
	return 0;
}

#undef add

int add(int x, int y)
{
	return x + y;
}