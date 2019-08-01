#include <stdio.h>

int main()
{
	int number, factorial = 1;
	
	printf("Enter a positive integer: ");
	scanf("%d", &number);
	for(int i = number; i >= 1; i--)
		factorial *= i;
	
	printf("Factorial of %d: %d", number, factorial);
	
	return 0;
}