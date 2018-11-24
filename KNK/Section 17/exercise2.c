#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void *duplicate(const char *str);

int main(void)
{
	char *p;
	
	p = duplicate("abc");
	
	printf("%s", p);
	
	return 0;
}

void *duplicate(const char *str)
{
	char *p;
	
	p = malloc(strlen(str) + 1);
	if (p == NULL)
		return NULL;
	else
	{
		strcpy(p, str);
		return p;
	}
}