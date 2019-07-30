#include <stdio.h>

int main()
{
	int n, m, one, two, tmp;
	
	printf("Enter two integers: ");
	scanf("%d %d", &one, &two);
	
	n = one > two ? two : one;
	m = one > two ? one : two;
	
	for (; n > 0; tmp = m, m = n, n = tmp % n);
	
	printf("Greatest common divisor: %d", m);
	
	return 0;
}