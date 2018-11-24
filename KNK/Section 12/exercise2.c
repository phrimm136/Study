#include <stdio.h>

int main()
{
	int a[] = {5, 15, 34, 54, 14, 2, 52, 72};
	int *high = &a[6], *low = &a[2], *middle = low + (high - low) / 2;
	
	printf("%d", *middle);
	
	return 0;
}