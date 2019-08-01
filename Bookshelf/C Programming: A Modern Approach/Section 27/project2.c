#include <stdio.h>
#include <math.h>

int main(void)
{
	double a, b, r, angle;
	
	printf("Enter a complex number (a+bi): ");
	scanf("%lf+%lfi", &a, &b);
	
	r = sqrt(a * a + b * b);
	angle = atan2(b, a);

	printf("r: %.2f, angle: %.2f", r, angle);

	return 0;
}