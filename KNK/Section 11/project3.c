#include <stdio.h>

void reduce(int numerator, int denominator, int *reduced_numerator, int *reduced_denominator);

int main()
{
	int numerator, denominator, reduced_numerator, reduced_denominator;
	
	printf("Enter a fraction: ");
	scanf("%d/%d", &numerator, &denominator);
	
	reduce(numerator, denominator, &reduced_numerator, &reduced_denominator);
	
	printf("In lowest terms: %d/%d", reduced_numerator, reduced_denominator);
	
	return 0;
}

void reduce(int numerator, int denominator, int *reduced_numerator, int *reduced_denominator)
{
	int n, m, tmp;
	
	n = numerator;
	m = denominator;
	
	for (; n > 0; tmp = m, m = n, n = tmp % n);
	
	*reduced_numerator = numerator / m;
	*reduced_denominator = denominator / m;
	
	
}