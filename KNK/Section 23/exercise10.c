#include <stdio.h>
#include <string.h>

int main(void)
{	
	char *str = "pen";
	
	if (strstr("pen#pineapple#apple", str) != NULL)
		putchar('a');
	
	return 0;
}