#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	FILE *fp;
	int ch, char_count = 0, word_count = 0, line_count = 0;
	bool EOF_start = 1;
	
	if (argc != 2)
	{
		fprintf(stderr, "usage: count file\n");
		exit(EXIT_FAILURE);
	}
		
	if ((fp = fopen(argv[1], "r")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", argv[1]);
		exit(EXIT_FAILURE);
	}
	
	while ((ch = getc(fp)) != EOF)
	{
		EOF_start = 0;
		char_count++;
		if (ch == ' ')
			word_count++;
		if (ch == '\n')
		{
			word_count++;
			line_count++;
		}
	}
	if (!EOF_start)
	{
		word_count++;
		line_count++;
	}

	printf("%s -> character: %d, word: %d, line: %d", argv[1], char_count, word_count, line_count);
	
	return 0;
}