#include <stdio.h>

int digit(int n, int k);

int main()
{
	int n, k;
	
	printf("Enter a number: ");
	scanf("%d", &n);
	printf("Enter a digit you want to know (from the right): ");
	scanf("%d", &k);
	
	printf("the %d th digit of %d is %d", k, n, digit(n, k));
	
	return 0;
}

int digit(int n, int k)
{
	for (int i = 1; i < k; i++, n /= 10);
	
	return n % 10;
}