#include <stdio.h>
#include <ctype.h>

int compute_scrabble_value(const char *word);

int main()
{
	char word[100];
	
	printf("Enter a word: ");
	scanf("%s", word);
	
	printf("Scrabble value: %d", compute_scrabble_value(word));
	
	return 0;
}

int compute_scrabble_value(const char *word)
{
	int value = 0;
	
	for (; *word; word++)
	{
		switch (toupper(*word))
		{
			case 'A' : case 'E': case 'I': case 'L' : case 'N' : case 'O' : case 'R' : case 'S' : case 'T' :
			case 'U' : value += 1; break;
			case 'D' : case 'G' : value += 2; break;
			case 'B' : case 'C' : case 'M' : case 'P' : value += 3; break;
			case 'F' : case 'H' : case 'V' : case 'W' : case 'Y' : value += 4; break;
			case 'K' : value += 5; break;
			case 'J' : case 'X' : value += 8; break;
			case 'Q' : case 'Z' : value += 10; break;
		}
	}
	
	return value;
}