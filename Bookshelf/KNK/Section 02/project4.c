#include <stdio.h>

int main()
{
	double money;
	
	printf("Enter an amount: ");
	scanf("%lf", &money);
	
	printf("With tax added: $%.2f\n", money * 1.05);
	
	return 0;
}