#include <stdio.h>

int GCD(int one, int two);

int main()
{
	int one, two;
	
	printf("Enter two integers: ");
	scanf("%d %d", &one, &two);
	
	printf("Greatest common divisor: %d", GCD(one, two));
	
	return 0;
}

int GCD(int one, int two)
{
	int n, m, tmp;
	
	n = one > two ? two : one;
	m = one > two ? one : two;
	
	if (n == 0)
		return m
	else
		GCD(n, m % n);
}