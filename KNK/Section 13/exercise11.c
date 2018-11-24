#include <stdio.h>
#include <string.h>

int _strcmp(char *s, char *t);

int main(void)
{
	char s1[5] = "free", s2[5] = "tree";
	
	printf("%d", _strcmp(s1, s2));
	
	return 0;
}

int _strcmp(char *s, char *t)
{
	int *p, *q;
	
	for (p = s, q = t; *p == *q; p++, q++)
		if (*p == '\0')
			return 0;
	return *p - *q;
}