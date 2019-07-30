#include <stdio.h>

int count_spaces(const char *s);

int main(void)
{
	char *s = "To be or not to be, that is a question.";
	
	printf("%d", count_spaces(s));
	
	return 0;
}

int count_spaces(const char *s)
{
	int count = 0;
	
	while (*s)
		if (*s++ == ' ')
			count++;
	return count;
}