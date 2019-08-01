#include <stdio.h>

int count_periods(const char *filename);

int main(void)
{
	char ch[100];
	
	scanf("%s", ch);
	
	printf("%d", count_periods(ch));
	
	return 0;
}

int count_periods(const char *filename)
{
	FILE *fp;
	int n = 0;
	char ch;
	
	if ((fp = fopen(filename, "r")) != NULL)
	{
		while ((ch = fgetc(fp)) != EOF)
			if (ch == '.')
				n++;
		fclose(fp);
	}
	
	return n;
}