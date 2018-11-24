#include <stdio.h>

#define N 10

int main()
{
	int a[N] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	int *p = &a[0], *q = &a[N-1], tmp;
	
	while (p < q)
	{
		tmp = *p;
		*p++ = *q;
		*q-- = tmp;
	}
	
	for (int i = 0; i < N; i++)
		printf("%d ", a[i]);
	
	return 0;
}