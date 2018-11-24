#include <stdio.h>

int main()
{
	int i = 3;
	char c = 104;
	
	i += c;
	c = 2 * c - 1;
	putchar(c);
	printf(c); // illegal
	
	return 0;
}