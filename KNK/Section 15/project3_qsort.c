#include <stdio.h>
#include "project3_quicksort.h"

int main()
{
	int a[N], i;
	
	printf("Enter %d numbers to be sorted: ", N);
	for (i = 0; i < N; i++)
		scanf("%d", &a[i]);
	quicksort(a, 0, N - 1);
	
	printf("In sorted order: ");
	for (i = 0; i < N; i++)
		printf("%d ", a[i]);
	printf("\n");
	
	return 0;
}