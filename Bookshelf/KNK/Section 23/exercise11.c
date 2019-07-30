#include <stdio.h>
#include <string.h>

int main(void)
{	
	int n = 10;
	char str[] = "pen pineapple apple pen";
	
	memset(str + (strlen(str) - n), '!', n);
	printf("%s", str);
	
	return 0;
}