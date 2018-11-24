#include <stdio.h>

double inner_product(const double *a, const double *b, int n);

int main()
{
	double arr1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	double arr2[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	
	printf("%f", inner_product(arr1, arr2, 10));
	
	return 0;
}

double inner_product(const double *a, const double *b, int n)
{
	double *p, *q, sum = 0;
	for (p = a, q = b; p < a + n; p++, q++)
		sum += *p * *q;
	return sum;
}