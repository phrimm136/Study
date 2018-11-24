#include <stdio.h>
#include <string.h>

void censor(char *str, int n);

int main(void)
{
	char s[100];
	
	scanf("%s", s);
	
	censor(s, strlen(s));
	
	printf("%s", s);
	
	return 0;
}

void censor(char *str, int n)
{
	for (int i = 0; i < n - 2; i++)
		if (str[i] == 'f' && str[i + 1] == 'o' && str[i + 2] == 'o')
			str[i] = str[i + 1] = str[i + 2] = 'x';
}