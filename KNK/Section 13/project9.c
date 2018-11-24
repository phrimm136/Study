#include <stdio.h>
#include <ctype.h>

int compute_vowel_count(const char *sentence);

int main()
{
	char sentence[100];
	
	printf("Enter a sentence: ");
	scanf("%s", sentence);
	
	printf("Your sentence contains %d vowels.", compute_vowel_count(sentence));
	
	return 0;
}

int compute_vowel_count(const char *sentence)
{
	int numbers_of_vowel = 0;
	
	for (; *sentence; sentence++)
	{
		if (toupper(*sentence) == 'A' || toupper(*sentence) == 'E' || toupper(*sentence) == 'I' ||
			toupper(*sentence) == 'O' || toupper(*sentence) == 'U')
			numbers_of_vowel++;
	}
	
	return numbers_of_vowel;
}