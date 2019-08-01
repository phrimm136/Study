#include <stdio.h>
#include <conio.h>

int main(void)
{
	char ch[5];
	
	ch[0] = getch();	
	ch[1] = getchar();
	ch[2] = getc(stdin);
	ch[3] = fgetc(stdin);
	printf("%s\n", ch);
	
	return 0;
}