#include <stdio.h>

int main()
{
	int number;
	
	printf("Enter a number: ");
	scanf("%d", &number);
	
	if (number >= 0 && number <= 9)
		printf("The number %d has 1 digits", number);
	else if (number <= 99)
		printf("The number %d has 2 digits", number);
	else
		printf("The number %d has 3 digits", number);
	
	return 0;
}