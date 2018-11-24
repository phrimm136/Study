#include <stdio.h>

double inner_product(double a[],double b[], int n);

int main()
{
	double a[] = {1, 2, 3, 4}, b[] = {1, 2, 3, 4};
	int n = (int) sizeof(a) / sizeof(a[0]);
	
	printf("The function returns %g\n", inner_product(a, b, n));
		
	return 0;
}

double inner_product(double a[],double b[], int n)
{
	double sum = 0.0;
	
	for (int i = 0; i < n; i++)
		sum += a[i] * b[i];
	
	return sum;
}