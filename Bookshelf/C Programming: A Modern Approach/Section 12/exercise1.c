#include <stdio.h>

int main()
{
	int a[] = {5, 15, 34, 54, 14, 2, 52, 72};
	int *p = &a[1], *q = &a[5];
	
	printf("%d %d %d %d %d", *(p + 3), *(q - 3), q - p, p < q, *p < *q);
	
	return 0;
}