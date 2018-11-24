#include <stdio.h>

int main()
{
	short unsigned int a = 1;
	short float b = 2.0; // illegal
	long double c = 3.0;
	unsigned long d = 4;
	
	printf("%hu %f %Lf %lu", a, b, c, d);
	
	return 0;
}