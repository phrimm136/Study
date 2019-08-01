#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	FILE *fp;
	int ch;
	
	if (argc < 2)
	{
		fprintf(stderr, "usage: fcat files\n");
		exit(EXIT_FAILURE);
	}
		
	for (int i = 1; i < argc; i++)
	{
		if ((fp = fopen(argv[i], "r")) == NULL)
		{
			fprintf(stderr, "Can't open %s\n", argv[i]);
			exit(EXIT_FAILURE);
		}
		
		while ((ch = fgetc(fp)) != EOF)
			putchar(ch);
		putchar('\n');
	}
	
	return 0;
}