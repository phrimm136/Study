#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

int main()
{
	FILE *fp_in, *fp_out;
	char filename[50];
	int ch, shift_amount;
	
	printf("Enter name of file to be encrypted: ");
	scanf("%s", filename);
	if ((fp_in = fopen(filename, "r")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", filename);
		exit(EXIT_FAILURE);
	}
	
	strcat(filename, ".enc");
	if ((fp_out = fopen(filename, "w+")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n",filename);
		exit(EXIT_FAILURE);
	}
	
	printf("Enter shift amount (1-25): ");
	scanf("%d", &shift_amount);
	
	for (; (ch = fgetc(fp_in)) != EOF;)
	{
		if (islower(ch))
		{
			ch = ((ch - 'a') + shift_amount) % 26 + 'a';
		}
		if (isupper(ch))
		{
			ch = ((ch - 'A') + shift_amount) % 26 + 'A';
		}
		
		fputc(ch, fp_out);
	}
	
	return 0;
}