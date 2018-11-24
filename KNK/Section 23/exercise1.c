#include <stdio.h>
#include <math.h>

double round_nearest(double x, int n);

int main(void)
{
	printf("%g", round_nearest(3.14159, 3));
	
	return 0;
}

double round_nearest(double x, int n)
{
	int n_digit = pow(10, n);
	
	x *= n_digit;
	x = nearbyint(x) / n_digit;
	
	return x;
}