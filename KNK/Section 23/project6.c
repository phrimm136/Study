#include <stdio.h>
#include <ctype.h>

int main(void)
{	
	char ch;
	
	while ((ch = getchar()) != EOF)
	{
		if (ch == '\n')
			ch = '?';
		putchar(ch);
	}
	
	return 0;
}