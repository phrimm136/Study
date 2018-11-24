#include <stdio.h>

unsigned int count_ones(unsigned char ch);

int main(void)
{
	char ch;
	
	scanf("%c", &ch);
	
	printf("%c (%d)-> %d", ch, (int) ch, count_ones(ch));
	
	return 0;
}

unsigned int count_ones(unsigned char ch)
{
	int n = 0;
	
	switch (ch & 0x0F)
	{
		case 1: case 2: case 4: case 8: n++; break;
		case 3: case 5: case 6: case 9: case 10: case 12: n += 2; break;
		case 7: case 11: case 13: case 14: n += 3; break;
		case 15: n += 4; break;
		default: break;
	}
	switch (ch >> 4)
	{
		case 1: case 2: case 4: case 8: n++; break;
		case 3: case 5: case 6: case 9: case 10: case 12: n += 2; break;
		case 7: case 11: case 13: case 14: n += 3; break;
		case 15: n += 4; break;
		default: break;
	}
	
	return n;
}