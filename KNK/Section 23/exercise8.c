#include <stdio.h>
#include <string.h>

int numchar(const char *s, char ch);

int main(void)
{	
	char *str = "pen pineapple apple pen", ch = 'p';
	
	printf("%d", numchar(str, ch));
	
	return 0;
}

int numchar(const char *s, char ch)
{
	int number_of_char = 0;
	char *p;
	
	p = strchr(s, ch);
	while (p != NULL)
	{
		number_of_char++;
		p = strchr(p+1, ch);
	}
	
	return number_of_char;
}