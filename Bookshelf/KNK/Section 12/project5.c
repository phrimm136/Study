#include <stdio.h>

int main()
{
	char sentence[100] = {' '}, terminating_characher, ch = '\0', *p;
	
	printf("Enter a sentence: ");
	for (p = sentence + 1;;p++)
	{
		ch = getchar();
		if(ch == '.' || ch == ',' || ch == '!' || ch == '?')
		{
			terminating_characher = ch;
			*p = ' ';
			break;
		}
		*p = ch;
	}
	
	printf("Reversal of sentence:");
	for (p--; p >= sentence; p--)
	{
		if (*p == ' ')
		{
			char *q = p;
			do
			{
				printf("%c", *q);
				q++;
			}
			while (*q != ' ');				
		}
	}
	printf("%c", terminating_characher);
	
	return 0;
}