#include <stdio.h>

unsigned int f(unsigned int i, int m, int n);

int main(void)
{
	int n;
	unsigned int i = 0xFF;
	
	printf("0x%08X", f(i, 10, 8));
	
	return 0;
}

unsigned int f(unsigned int i, int m, int n)
{
	return (i >> (m + 1 - n)) & ~(~0 << n);
}