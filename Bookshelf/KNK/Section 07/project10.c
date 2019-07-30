#include <stdio.h>
#include <ctype.h>

int main()
{
	char alphabet = '\0';
	int numbers_of_vowel = 0;
	
	printf("Enter a sentence: ");
	while (alphabet != '\n')
	{
		alphabet = getchar();
		if (toupper(alphabet) == 'A' || toupper(alphabet) == 'E' || toupper(alphabet) == 'I' ||
			toupper(alphabet) == 'O' || toupper(alphabet) == 'U')
			numbers_of_vowel++;
	}
	
	printf("Your sentence contains %d vowels.", numbers_of_vowel);
	
	return 0;
}