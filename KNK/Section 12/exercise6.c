#include <stdio.h>

int sum_array(int *p, int n);

int main()
{
	int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, *p = a;
	
	printf("%d", sum_array(p, 10));
	
	return 0;
}

int sum_array(int *p, int n)
{
	int i, sum;
	
	sum = 0;
	for (i = 0; i < n; i++)
		sum += *(p + i);
	return sum;
}