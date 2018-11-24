#include <stdio.h>
#include <stdlib.h>

#define KEY '&'

int main(int argc, char *argv[])
{
	FILE *fp_orig, *fp_new;
	int orig_char, new_char;
	
	if (argc < 2)
	{
		fprintf(stderr, "usage: xor original to_en(de)crypt\n");
		exit(EXIT_FAILURE);
	}
		
	if ((fp_orig = fopen(argv[1], "rb")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", argv[1]);
		exit(EXIT_FAILURE);
	}
	if ((fp_new = fopen(argv[2], "wb+")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", argv[2]);
		exit(EXIT_FAILURE);
	}
	
	while ((orig_char = getc(fp_orig)) != EOF)
	{
		new_char = orig_char ^ KEY;
		putc(new_char, fp_new);
	}
	
	return 0;
}