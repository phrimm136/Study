#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>

bool is_palindrome(const char *message);

int main()
{
	char message[100];
	
	printf("Enter a message: ");
	gets(message);
	
	
	if (is_palindrome)
		printf("Palindrome");
	else
		printf("Not a palindrome");
	
	return 0;
}

bool is_palindrome(const char *message)
{
	for (char *p = message, *q = message + strlen(message) - 1; p < message + strlen(message) && q >= message;)
	{
		if (isalpha(*p) && isalpha(*q))
		{
			if (*p == *q)
			{
				p++;
				q--;
			}
			else
				return false;
		}
		if (isalpha(*p) == 0)
			p++;
		if (isalpha(*q) == 0)
			q--;
	}
	return true;
}