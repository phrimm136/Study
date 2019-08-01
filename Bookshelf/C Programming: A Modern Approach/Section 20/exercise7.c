#include <stdio.h>

unsigned int rotate_left(unsigned int i, int n);
unsigned int rotate_right(unsigned int i, int n);

int main(void)
{
	int n;
	unsigned int i = 0x12345678;
	
	printf("Enter a number to rotate 0x12345678 (up to 31): ");
	scanf("%d", &n);
	
	printf("0x%x left rotated %d time(s): 0x%08x\n", i, n, rotate_left(i, n));
	printf("0x%x right rotated %d time(s): 0x%08x\n", i, n, rotate_right(i, n));
	
	return 0;
}

unsigned int rotate_left(unsigned int i, int n)
{
	return i << n | i >> (32 - n);
}

unsigned int rotate_right(unsigned int i, int n)
{
	return i >> n | i << (32 - n);
}