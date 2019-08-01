#include <stdio.h>

int main()
{
	int first, second, third;
	
	printf("Enter a three-digit number: ");
	scanf("%1d%1d%1d", &third, &second, &first);
	
	printf("The reversal is: %d%d%d", first, second, third);
	
	return 0;
}