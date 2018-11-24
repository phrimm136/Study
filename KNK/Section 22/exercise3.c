#include <stdio.h>

int main(void)
{
	FILE *fp;
	int ch;
	
	if ((fp = fopen("f1.txt", "r")))
	{
		while ((ch = getc(fp)) != EOF)
			putchar(ch);
	}
	fclose(fp);
	
	return 0;
}