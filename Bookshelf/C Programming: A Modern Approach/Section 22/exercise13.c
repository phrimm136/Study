#include <stdio.h>
#include <stdlib.h>

int line_length(const char *filename, int n);

int main(void)
{
	char filename[100];
	int n;
	
	scanf("%s", filename);
	scanf("%d", &n);
	
	printf("%d", line_length(filename, n));
	
	return 0;
}

int line_length(const char *filename, int n)
{
	FILE *fp;
	int len = 0;
	char ch;
	
	if ((fp = fopen(filename, "r")) == NULL)
		return 0;
	
	for (; n > 1; n--)
		while ((ch = getc(fp)) != '\n')
			;
	
	while ((ch = getc(fp)) != '\n')
		len++;
		
	return len;
}