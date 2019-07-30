#include <stdio.h>

int main()
{
	int n;
	
	n = 4;
	if (n >= 1 <= 10)
		printf("n is between 1 and 10\n");
	
	n = 20;
	if (n >= 1 <= 10)
		printf("n is between 1 and 10\n");
	
	n = 0;
	if (n >= 1 <= 10)
		printf("n is between 1 and 10\n");//comparison of constant '10' with boolean expression is always true
	
	return 0;
}