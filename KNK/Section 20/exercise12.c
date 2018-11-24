#include <stdio.h>

unsigned short create_short(unsigned char high_byte, unsigned char low_byte);

int main(void)
{
	unsigned char high_byte, low_byte;
	
	scanf("%c%c", &high_byte, &low_byte);
	
	printf("high byte %c(0x%X) + low byte %c(0x%X) = 0x%X", 
			high_byte, (int) high_byte, low_byte, (int) low_byte, create_short(high_byte, low_byte));
	
	return 0;
}

unsigned short create_short(unsigned char high_byte, unsigned char low_byte)
{
	return (high_byte << 8) + low_byte;
}