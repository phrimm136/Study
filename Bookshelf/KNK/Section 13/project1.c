#include <stdio.h>
#include <string.h>

int main(void)
{
	char smallest_word[21] = {'\0'}, largest_word[21] = {'\0'}, word[21];
	
	do
	{
		printf("Enter word: ");
		scanf("%s", word);
		if (*smallest_word == 0)
			strcpy(smallest_word, word);
		if (*largest_word == 0)
			strcpy(largest_word, word);
		
		if (strcmp(smallest_word, word) > 0)
			strcpy(smallest_word, word);
		if (strcmp(largest_word, word) < 0)
			strcpy(largest_word, word);
	}
	while (strlen(word) != 4);
	
	printf("Smallest word: %s\n", smallest_word);
	printf("Largest word: %s\n", largest_word);
	
	return 0;
}

