#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WORD_MAX_LENGTH 20

int read_line(char str[], int n);

int main(void)
{
	char string_input[WORD_MAX_LENGTH+1], *string_store[20];
	int string_number = 0;
	
	for (;;)
	{
		printf("Enter word: ");
		read_line(string_input, WORD_MAX_LENGTH);
		if (string_input[0] == '\0')
			break;
		string_store[string_number] = malloc(strlen(string_input));
		strcpy(string_store[string_number], string_input);
		string_number++;
		if (string_number >= 20)
		{
			printf("Max(20) words entered\n");
			break;
		}
	}
	
	for (int i = 0; i < string_number - 1; i++)
	{
		for (int j = 0; j < string_number - i - 1; j++)
		{
			char *tmp;
			
			if (strcmp(string_store[j], string_store[j+1]) > 0)
			{
				tmp = string_store[j];
				string_store[j] = string_store[j+1];
				string_store[j+1] = tmp;
			}
		}
	}
	
	printf("In sorted order: ");
	for (int i = 0; i < string_number; i++)
		printf("%s ", string_store[i]);
	
	return 0;
}

int read_line(char str[], int n)
{
	int ch, i = 0;
	
	while ((ch = getchar()) != '\n')
		if (i < n)
			str[i++] = ch;
	str[i] = '\0';
	return i;
}