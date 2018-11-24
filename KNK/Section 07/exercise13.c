#include <stdio.h>

int main()
{
	char c = '\1';
	short s = 2;
	int i = -3;
	long m = 5;
	float f = 6.5f;
	double d = 7.5;
	
	printf("%d\n", c * i); // int
	printf("%f\n", f / c); // float
	printf("%f\n", f - d); // double
	printf("%ld\n", s + m); // long
	printf("%f\n", d / s); // double
	printf("%d\n", (int) f); // int
	
	return 0;
}