#include <stdio.h>
#include <ctype.h>

int main()
{
	char ch = '\0';
	int ananas[26] = {0};
	
	printf("Enter first word: ");
	for(int i = 0;; i++)
	{
		ch = getchar();
		if (ch == '\n')
			break;
		if (isalpha(ch))
			ananas[tolower(ch) - 'a']++;
	}
	printf("Enter second word: ");
	for(int i = 0;; i++)
	{
		ch = getchar();
		if (ch == '\n')
			break;
		if (isalpha(ch))
			ananas[tolower(ch) - 'a']--;
	}
	
	for (int i = 0; i < 26; i++)
	{
		if (ananas[i] != 0)
		{
			printf("The words are not anagrams.");
			return 0;
		}
	}
	printf("The words are anagrams.");
	
	return 0;
}