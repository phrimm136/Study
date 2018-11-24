#include <stdio.h>

int main()
{
	int i, first, second, third;
	
	printf("Enter a three-digit number: ");
	scanf("%d", &i);
		
	first = i % 10; i /= 10;
	second = i % 10; i /=10;
	third = i % 10;
	
	printf("The reversal is: %d%d%d", first, second, third);
	
	return 0;
}