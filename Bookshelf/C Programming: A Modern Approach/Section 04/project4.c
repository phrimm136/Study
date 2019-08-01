#include <stdio.h>

int main()
{
	int number;
	
	printf("Enter a number between 0 and 32767: ");
	scanf("%d", &number);
	
	printf("In octal, your number is: 0%o", number);
	
	return 0;
}