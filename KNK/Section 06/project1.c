#include <stdio.h>

int main()
{
	double n, max = 0.0;
	
	do
	{
		printf("Enter a number: ");
		scanf("%lf", &n);
		
		if (n > max)
			max = n;
	}
	while (n > 0);
	
	printf("The largest number entered was %g", max);
	
	return 0;
}