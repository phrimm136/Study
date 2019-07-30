#include <stdio.h>

int main()
{
	int i;
	
	printf("Enter a two-digit number: ");
	scanf("%d", &i);
	
	printf("The reversal is: ");
	
	for (; i != 0; i /= 10)
		printf("%d", i % 10);
	
	return 0;
}