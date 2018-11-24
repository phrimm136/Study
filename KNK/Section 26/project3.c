#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 1000

int compar(const void *p, const void *q);

int main(void)
{
	clock_t start;
	int arr[MAX];
		
	for (int i = 0; i < MAX; i++)
		arr[i] = MAX - 1;
		
	start = clock();
	
	qsort(arr, sizeof(arr) / sizeof(arr[0]), sizeof(arr[0]), compar);

	printf("%g", (clock() - start) / (double) CLOCKS_PER_SEC);
	
	return 0;
}

int compar(const void *p, const void *q)
{
	const int *x = p, *y = q;
	
	if (*x > *y)
		return 1;
	else if (*x < *y)
		return -1;
	else
		return 0;
}