#include <stdio.h>
#include <math.h>

int main(void)
{	
	double P, r;
	int t;
	
	printf("Enter the original amount deposited, the interest rate, and the number of years: ");
	scanf("%lf %lf %d", &P, &r, &t);
	
	printf("$%.2f", P * exp(r * t));
	
	return 0;
}