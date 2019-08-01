#include <stdio.h>

int f(int a, int b);

int main()
{
	int i;
	double x;
	
	i = f(83, 12);
	printf("%d\n", i);
	x = f(83, 12);
	printf("%f\n", x);
	i = f(3.15, 9.28);
	printf("%d\n", i);
	x = f(3.15, 9.28);
	printf("%f\n", x);
	printf("%d\n", f(83, 12));
	printf("%f\n", f(3.15, 9.28));
		
	return 0;
}

int f(int a, int b)
{
	return (a + b) / 2;
}