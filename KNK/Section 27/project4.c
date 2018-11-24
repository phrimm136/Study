#include <stdio.h>
#include <math.h>
#include <complex.h>

int main(void)
{
	int n;
	double complex roots_of_unity;
	
	printf("Enter a number to get the nth roots of unity: \n");
	scanf("%d", &n);
	
	printf("From 0 to %d, the %dth roots of unity is: ", n - 1, n);
	
	for (int k = 0; k < n; k++)
	{
		roots_of_unity = cexp(2 * 3.14 * I * k / n);
		printf("%.2f + %.2fi\n", creal(roots_of_unity), cimag(roots_of_unity));
	}

	return 0;
}