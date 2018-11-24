#include <stdio.h>
#include <string.h>

int main(void)
{
	char str[100];
	
	*str = 'o';
	*str = 0;
	printf("%c ", str[0]);
	
	*str = 'o';
	str[0] = '\0';
	printf("%c ", str[0]);
	
	*str = 'o';
	strcpy(str, "");
	printf("%c ", str[0]);
	
	*str = 'o';
	strcat(str, "");
	printf("%c ", str[0]); // not equivalent
	
	return 0;
}
