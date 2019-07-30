#include <stdio.h>

int main()
{
	char message[100] = {'\0'}, ch;
	int i = 0;

	while (1)
	{
		ch = getchar();
		if (ch == '\n')
			break;
		message[i] = ch;
		i++;
	}
	for (int j = i - 1; j >= 0; j--)
		printf("%c", message[j]);
	
	return 0;
}