#include <stdio.h>

double triangle_area(double base, double height);

int main()
{
	double base = 3, height = 4, product;
	
	product = triangle_area(base, height);
	
	printf("%lf", product);
	
	return 0;
}

double triangle_area(double base, double height)
{
	double product;
	
	product = base * height;
	
	return product / 2;
}