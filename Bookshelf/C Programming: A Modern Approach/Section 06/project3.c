#include <stdio.h>

int main()
{
	int n, m, one, two, tmp;
	
	printf("Enter a fraction: ");
	scanf("%d/%d", &one, &two);
	
	n = one;
	m = two;
	
	for (; n > 0; tmp = m, m = n, n = tmp % n);
	
	printf("In lowest terms: %d/%d", one / m, two / m);
	
	return 0;
}