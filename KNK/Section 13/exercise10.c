#include <stdio.h>
#include <string.h>

char *duplicate(const char *p);

int main(void)
{
	char str[5] = "free", *dup;
	
	dup = duplicate(str);
	
	printf("%s", dup);
	
	return 0;
}

char *duplicate(const char *p)
{
	char *q;
	
	strcpy(q, p);
	return q;
}