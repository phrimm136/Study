#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>

bool are_anagrams(const char *word1, const char *word2);

int main()
{
	char ananas1[20], ananas2[20];
	
	printf("Enter first word: ");
	scanf("%s", ananas1);
	printf("Enter second word: ");
	scanf("%s", ananas2);
	
	
	if (are_anagrams(ananas1, ananas2) == true)
		printf("The words are anagrams.");
	else
		printf("The words are not anagrams.");
	
	return 0;
}

bool are_anagrams(const char *word1, const char *word2)
{
	int anagram_check = 0;
	
	for (char *p = word1; *p; p++)
		anagram_check += (islower(*p) - 'a');
	for (char *p = word2; *p; p++)
		anagram_check -= (islower(*p) - 'a');
	
	if (anagram_check == 0)
		return true;
	else
		return false;
}