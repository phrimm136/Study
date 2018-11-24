#include <stdio.h>

int main()
{
	int knots;
	
	printf("Enter a wind speed in knots: ");
	scanf("%d", &knots);
	
	if (knots < 1)
		printf("Calm\n");
	else if (knots <= 3)
		printf("Light air\n");
	else if (knots <= 27)
		printf("Breeze\n");
	else if (knots <= 47)
		printf("Gale\n");
	else if (knots <= 63)
		printf("Storm\n");
	else
		printf("Hurricane\n");
	
	return 0;
}