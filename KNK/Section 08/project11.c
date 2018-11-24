#include <stdio.h>

int main()
{
	char ch[15] = {'\0'};
	
	printf("Enter phone number: ");
	for(int i = 0; i < 15; i++)
	{
		ch[i] = getchar();
		
		switch (ch[i])
		{
			case 'A' : case 'B' : case 'C' : ch[i] = '2'; break;
			case 'D' : case 'E' : case 'F' : ch[i] = '3'; break;
			case 'G' : case 'H' : case 'I' : ch[i] = '4'; break;
			case 'J' : case 'K' : case 'L' : ch[i] = '5'; break;
			case 'M' : case 'N' : case 'O' : ch[i] = '6'; break;
			case 'P' : case 'R' : case 'S' : ch[i] = '7'; break;
			case 'T' : case 'U' : case 'V' : ch[i] = '8'; break;
			case 'W' : case 'X' : case 'Z' : ch[i] = '9'; break;
		}
	}
	
	printf("In numeric form: ");
	for (int i = 0; i < 15; i++)
		printf("%c", ch[i]);
	
	return 0;
}