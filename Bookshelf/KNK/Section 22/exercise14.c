#include <stdio.h>
#include <stdlib.h>

char *my_fgets(char *restrict s, int n, FILE *restrict stream);
int my_fputs(const char *restrict s, FILE *restrict stream);

int main(void)
{
	char str[100];
	
	my_fgets(str, 10, stdin);
	my_fputs(str, stdout);
	
	return 0;
}

char *my_fgets(char *restrict s, int n, FILE *restrict stream)
{
	int ch;
	
	for (int i = 0; i < n - 1; i++)
	{
		ch = fgetc(stream);
		if (ch == EOF)
		{
			if (i == 0 || ferror(stream))
				return NULL;
			break;
		}
		s[i] = (char) ch;
		if (ch == '\n')
			break;
	}
	s[n-1] = '\0';
	
	return s;
}

int my_fputs(const char *restrict s, FILE *restrict stream)
{
	const char *ptr = s;
	int chk, len = 0;
	
	for (; *ptr != '\0'; ptr++)
	{
		chk = fputc(*ptr, stream);
		if (chk == EOF)
			return EOF;
		len++;
	}
	
	return len;
}