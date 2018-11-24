#include <stdio.h>
#include <string.h>
#include <ctype.h>

void capitalize(char *str, int n);

int main(void)
{
	char s[100];
	
	scanf("%s", s);
	
	capitalize(s, strlen(s));
	
	printf("%s", s);
	
	return 0;
}

void capitalize(char *str, int n)
{
	for (char *p = str; p < str + n; p++)
		if (*p >= 'a' && *p <= 'z')
			*p = toupper(*p);
}