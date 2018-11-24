#include <stdio.h>

int main()
{
	char ch = 'A';
	int b = 0b1000001, c = 0101, d = 0x41; // binary constants are a GCC extension
	
	printf("%d %d %d %d", ch, b, c, d);
	
	return 0;
}