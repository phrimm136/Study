#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	FILE *fp;
	char str[50];
	int number, year, month, day, EOF_flag = 0;
	double price;
	
	if (argc != 2)
	{
		printf("usage: reader file");
		exit(EXIT_FAILURE);
	}
	
	if ((fp = fopen(argv[1], "r")) == NULL)
	{
		fprintf(stderr, "Can't open file %s", argv[1]);
		exit(EXIT_FAILURE);
	}
	
	printf("Item\t\tUnit\t\tPurchase\n");
	printf("\t\tPrice\t\tDate\n");
	for (;;)
	{
		char ch;
		
		for (int i = 0;; i++)
		{
			if ((ch = fgetc(fp)) == '\n')
				break;
			if (ch == EOF)
			{
				EOF_flag = 1;
				break;
			}
			str[i] = ch;
		}
		sscanf(str, "%d,%lf,%2d/%2d/%4d", &number, &price, &month, &day, &year);
		printf("%-d\t\t$%7.2f\t%02d/%02d/%04d\n", number, price, month, day, year);
		
		if (EOF_flag == 1)
			break;
	}
	
	fclose(fp);
	
	return 0;
}