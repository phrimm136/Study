#include <stdio.h>

int main()
{
	char ch[100];
	int length;
	
	printf("Enter message: ");
	for (int i = 0;; i++)
	{
		scanf("%c", &ch[i]);
		if (ch[i] >= 'a' && ch[i] <= 'z')
			ch[i] = ch[i] - 'a' + 'A';
		
		if (ch[i] == '\n')
		{
			length = i;
			break;
		}
	}
	
	printf("In B1FF-speak: ");
	for (int i = 0; i < length; i++)
	{
		switch (ch[i])
		{
			case 'A' : ch[i] = '4'; break;
			case 'B' : ch[i] = '8'; break;
			case 'E' : ch[i] = '3'; break;
			case 'I' : ch[i] = '1'; break;
			case 'O' : ch[i] = '0'; break;
			case 'S' : ch[i] = '5'; break;
		}
		printf("%c", ch[i]);
	}
	printf("!!!!!!!!!!");
	
	return 0;
}