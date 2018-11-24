#include <stdio.h>
#include <ctype.h>

int main(void)
{	
	char str[100] = {'\0'}, ch = 0;
	int i = 0;
	
	while ((ch = getchar()) != EOF)
		if (!isspace(ch))
			str[i++] = ch;
	puts(str);
	
	return 0;
}