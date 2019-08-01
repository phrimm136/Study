#include <stdio.h>
#include <ctype.h>

int main()
{
	char message1[100] = {'\0'}, message2[100] = {'\0'}, ch, *p = &message1[0], *q;
	int len = 0;
	
	printf("Enter a message: ");
	while (1)
	{
		ch = getchar();
		if (ch == '\n')
		{
			p--;
			len--;
			break;
		}
		if (isalpha(ch))
		{
			*p = tolower(ch);
			p++;
			len++;
		}
	}
	for (p = &message1[0], q = &message2[len]; q >= &message2[0]; q--, p++)
		*q = *p;
	
	for (p = &message1[0], q = &message2[0]; p < &message1[len]; p++, q++)
		if (*p != *q)
		{
			printf("Not a palindrome");
			return 0;
		}
	printf("Palindrome");
	
	return 0;
}