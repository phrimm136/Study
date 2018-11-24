#include <stdio.h>

int main()
{
	int a = 1, b = 2, c = 3, d = 4, e = 5;
	
	printf("%d %d\n", a * b - c * d + e, (((a * b) - (c * d)) + e));
	printf("%d %d\n", a / b % c / d, (((a / b) % c) / d));
	printf("%d %d\n", - a - b + c - + d, ((((- a) - b) + c) - (+ d)));
	printf("%d %d\n", a * - b / c - d, (((a * (- b)) / c) - d));
	
	return 0;
}