#include <stdio.h>
#include <math.h>

int main()
{
	double x, y = 1;
	
	printf("Enter a positive number: ");
	scanf("%lf", &x);
	for (;;)
	{
		if(fabs(y - (y + x / y) / 2) < .00001)
		{
			y = (y + x / y) / 2;
			break;
		}
		else
			y = (y + x / y) / 2;
	}
	
	printf("Square root: %f", y);
	
	return 0;
}