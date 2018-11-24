#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>

int main(void)
{	
	char ch = 0;
	bool capitalize = 1;
	
	while ((ch = getchar()) != EOF)
	{
		if (isspace(ch))
		{
			capitalize = 1;
			putchar(ch);
		}
		else if (capitalize)
		{
			capitalize = 0;
			putchar(toupper(ch));
		}
		else
			putchar(ch);
	}
	
	return 0;
}