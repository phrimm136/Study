#include <stdio.h>

double median(double x, double y, double z);

int main()
{
	double x, y, z;
	
	printf("Enter three real numbers: ");
	scanf("%lf %lf %lf", &x, &y, &z);
	
	printf("The median of the three numbers is %g", median(x, y, z));
	
	return 0;
}

double median(double x, double y, double z)
{
	int mid;
	
	if (x <= y)
	{
		if (y <= z)
			mid = y;
		else if (x <= z)
			mid = z;
		else
			mid = x;
	}
	else
	{
		if (x <= z)
			mid = x;
		else if (y <= z)
			mid = z;
		else
			mid = y;
	}
		
	return mid;
}