#include <stdio.h>
#include <string.h>

int main(void)
{
	char *p = "abc";
	
	//putchar(p);
	putchar(*p);
	puts(p);
	//puts(*p);
	
	return 0;
}