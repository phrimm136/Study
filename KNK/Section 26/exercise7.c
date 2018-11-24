#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	long int value;
	char *p = "123456789";
	
	value = strtol(p, &p, 8);
	if (*p == '\0')
		printf("%ld", value);
	else
		printf("'%c'", *++p);
	
	return 0;
}