#include <stdio.h>

int main(void)
{
	int n, i, j;
	float x;
	
	n = scanf("%d%f%d", &i, &x, &j);
	printf("n = %d, i = %d, x = %g, j = %d\n", n, i, x, j);
	
	n = scanf("%d%f%d", &i, &x, &j);
	printf("n = %d, i = %d, x = %g, j = %d\n", n, i, x, j);
	
	n = scanf("%d%f%d", &i, &x, &j);
	printf("n = %d, i = %d, x = %g, j = %d\n", n, i, x, j);
	
	n = scanf("%d%f%d", &i, &x, &j);
	printf("n = %d, i = %d, x = %g, j = %d\n", n, i, x, j);
	
	return 0;
}