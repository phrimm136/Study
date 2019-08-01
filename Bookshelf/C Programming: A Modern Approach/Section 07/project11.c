#include <stdio.h>
#include <ctype.h>

int main()
{
	char first_initial = '\0', alphabet;
	
	printf("Enter a first and last name: ");
	first_initial = getchar();
	while (getchar() != ' ');
	while (1)
	{
		alphabet = getchar();
		if (alphabet == '\n')
			break;
		putchar(alphabet);
	}
	
	
	printf(", %c.", first_initial);
	
	return 0;
}