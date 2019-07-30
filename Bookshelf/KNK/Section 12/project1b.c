#include <stdio.h>

int main()
{
	char message[100] = {'\0'}, ch;
	char *p = message;

	while (1)
	{
		ch = getchar();
		if (ch == '\n')
		{
			p--;
			break;
		}
		*p = ch;
		p++;
	}
	for (; p >= &message[0]; p--)
		printf("%c", *p);
	
	return 0;
}