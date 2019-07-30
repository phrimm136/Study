#include <stdio.h>

int main()
{
	char sentence[100] = {' '}, terminating_characher, ch = '\0';
	int length = 1;
	
	printf("Enter a sentence: ");
	for (;;length++)
	{
		ch = getchar();
		if(ch == '.' || ch == ',' || ch == '!' || ch == '?')
		{
			terminating_characher = ch;
			sentence[length] = ' ';
			break;
		}
		sentence[length] = ch;
	}
	
	printf("Reversal of sentence:");
	for (int i = length - 1; i >= 0; i--)
	{
		if (sentence[i] == ' ')
		{
			int j = i;
			do
			{
				printf("%c", sentence[j]);
				j++;
			}
			while (sentence[j] != ' ');				
		}
	}
	printf("%c", terminating_characher);
	
	return 0;
}