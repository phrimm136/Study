#include <stdio.h>

int main()
{
	char ch = '\0', first_initial = '\0', last_name[20] = {'\0'};
	int length_name = 0;
	
	printf("Enter a first and last name: ");
	for(;;)
	{
		ch = getchar();
		if (ch == ' ')
			break;
		if (first_initial == '\0')
			first_initial = ch;
	}
	for(;; length_name++)
	{
		ch = getchar();
		if (ch == '\n')
			break;
		last_name[length_name] = ch;
	}
	
	printf("You entered the name: ");
	for(int i = 0; i < length_name; i++)
		printf("%c", last_name[i]);
	printf(", %c.", first_initial);
	
	return 0;
}