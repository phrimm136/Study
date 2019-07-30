#include <stdio.h>
#include <ctype.h>

int main()
{
	char message1[100] = {'\0'}, ch;
	int len = 0;
	
	printf("Enter a message: ");
	while (1)
	{
		ch = getchar();
		if (ch == '\n')
		{
			len--;
			break;
		}
		if (isalpha(ch))
		{
			message1[len] = tolower(ch);
			len++;
		}
	}
	char message2[len];
	for (int i = 0; i < len; i++)
		message2[i] = message1[len - i];
	
	for (int i = 0; i < len; i++)
		if (message1[i] != message2[i])
		{
			printf("Not a palindrome");
			return 0;
		}
	printf("Palindrome");
	
	return 0;
}