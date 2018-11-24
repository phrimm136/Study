#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "project4_line.h"

#define MAX_LINE_LEN 60

struct Line
{
	char word;
	struct Line *next;
} *line = NULL;
int line_len = 0;
int num_words = 0;

void clear_line(void)
{
	struct Line *tmp;
	
	while(line != NULL)
	{
		tmp = line;
		line = line->next;
		free(tmp);
	}
	line_len = 0;
	num_words = 0;
}

void add_word(const char *word)
{
	struct Line *new, *prev, *cur;
	if (num_words > 0)
	{
		for (prev = NULL, cur = line; cur != NULL; prev = cur, cur = cur->next)
			;
		prev->word = ' ';
		line_len++;
	}
	for (int i = 0; i <= (int)strlen(word); i++)
	{
		new = malloc(sizeof(struct Line));
		new->word = word[i];
		new->next = NULL;
		if (line == NULL)
			line = new;
		else
		{
			for (prev = NULL, cur = line; cur != NULL; prev = cur, cur = cur->next)
				;
			prev->next = new;
		}
		line_len++;
	}
	num_words++;
	line_len--;
}

int space_remaining(void)
{
	return MAX_LINE_LEN - line_len;
}

void write_line(void)
{
	int extra_spaces, spaces_to_insert, i, j;
	
	extra_spaces = MAX_LINE_LEN - line_len;
	for (i = 0; i < line_len; i++)
	{
		if (line->word != ' ')
			putchar(line->word);
		else
		{
			spaces_to_insert = extra_spaces / (num_words - 1);
			for (j = 1; j <= spaces_to_insert + 1; j++)
				putchar(' ');
			extra_spaces -= spaces_to_insert;
			num_words--;
		}
		line = line->next;
	}
	putchar('\n');
}

void flush_line(void)
{
	struct Line *cur;
	
	if (line_len > 0)
		for (cur = line; cur != NULL; cur = cur->next)
			putchar(cur->word);
}