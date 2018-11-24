#include <stdio.h>
#include <math.h>

double evaluate_polynomial(double a[], int n, double x);

int main(void)
{
	double a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	
	printf("%g", evaluate_polynomial(a, 9, 2.0));
	
	return 0;
}

double evaluate_polynomial(double a[], int n, double x)
{
	double poly = fma(a[n], x, a[n-1]);
	
	for (int i = n - 1; i >= 1; i--)
	{
		poly = fma(poly, x, a[i-1]);
	}
	
	return poly;
}