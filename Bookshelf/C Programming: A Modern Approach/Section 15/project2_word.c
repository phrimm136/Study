#include <stdio.h>
#include "project2_word.h"

int read_char(void)
{
	int ch = getchar();
	
	if (ch == '\n' || ch == '\t')
		return ' ';
	return ch;
}

void read_word(char *word, int len)//21
{
	int ch, pos = 0;
	
	while ((ch = read_char()) == ' ')
		;
	while (ch != ' ' && ch != EOF)
	{
		if (pos < len)
			word[pos++] = ch;
		ch = read_char();
	}
	if (pos == len - 1)
		word[pos-1] = '*';
	word[pos] = '\0';
}