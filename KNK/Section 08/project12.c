#include <stdio.h>
#include <ctype.h>

int main()
{
	char ch = '\0';
	int value = 0,
		scrabble[26] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};
	
	printf("Enter a word: ");
	while (1)
	{
		ch = getchar();
		if (ch == '\n')
			break;
		value += scrabble[toupper(ch) - 'A'];
	}
	printf("Scrabble value: %d", value);
	
	return 0;
}