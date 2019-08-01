#include <stdio.h>
#include <string.h>

void reverse(char *message);

int main()
{
	char message[100];

	gets(message);
	
	reverse(message);
	
	return 0;
}

void reverse(char *message)
{
	for (char *p = message + strlen(message) - 1; p >= message; p--)
		printf("%c", *p);
}