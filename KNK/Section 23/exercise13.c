#include <stdio.h>
#include <string.h>

int count_words(char *sentence);

int main(void)
{	
	char s[50] = "pen pineapple apple pen";
	
	printf("%d", count_words(s));
	
	return 0;
}

int count_words(char *sentence)
{
	int words = 0;
	char sentence_copy[strlen(sentence)+2], *p;
	
	strcpy(sentence_copy, " ");
	strcat(sentence_copy, sentence);
	
	p = strtok(sentence_copy, " \t");
	
	for (; p != NULL; p = strtok(NULL, " \t"))
		words++;
		
	return words;
}