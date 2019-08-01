#include <stdio.h>

int main(void)
{
	char ch[2];
	
	for (;;)
	{
		scanf("%1s", ch);
		if (ch[0] == '\n')
			break;
		printf("%c", ch[0]);
	}
	
	return 0;
}