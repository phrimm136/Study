#include <stdio.h>

unsigned short reverse_bits(unsigned short i);

int main(void)
{
	unsigned short i = 0xF0;
	
	printf("0x%02X -> 0x%02X", i, reverse_bits(i));
	
	return 0;
}

unsigned short reverse_bits(unsigned short i)
{
	unsigned short reversed = 0;
	for (int j = 0; j < 8; j++)
		if (i & (1 << j))
			reversed |= 1 << (8 - (j + 1));
	
	return reversed;
}