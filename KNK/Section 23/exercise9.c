#include <stdio.h>
#include <string.h>

int main(void)
{	
	char *str = "pen pineapple apple pen";
	
	for (char *p = str; *p != '\0'; p++)
		if (strchr("abc", *p) != NULL)
			putchar(*p);
	
	return 0;
}