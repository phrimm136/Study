#include <stdio.h>
#include <math.h>

void quadratic_formula(double a, double b, double c);

int main(void)
{	
	int a = 1, b = -4, c = 3;
	
	quadratic_formula(a, b, c);
		
	return 0;
}

void quadratic_formula(double a, double b, double c)
{	
	if (pow(b, 2) - 4 * a * c < 0)
		printf("complex value\n");
	else if (pow(b, 2) == 4 * a * c)
		printf("%f", -b / (2 * a));
	else
		printf("%g %g\n", (-b - sqrt(pow(b, 2) - 4 * a * c)) / (2 * a), (-b + sqrt(pow(b, 2) - 4 * a * c)) / (2 * a));
}