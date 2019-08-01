#include <stdio.h>
#include <math.h>

int main(void)
{
	double a, b, r, angle;
	
	printf("Enter a complex number in polar coordinates (r, theta): ");
	scanf("%lf, %lf", &r, &angle);
	
	a = r * cos(angle);
	b = r * sin(angle);

	printf("Converted in Cartesian form: %f+%fi", a, b);

	return 0;
}