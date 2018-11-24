#include <stdio.h>

#define N 10

int main()
{
	int a[N], i, size = sizeof(a) / sizeof(a[0]);
	
	printf("Enter %d numbers: ", N);
	for (i = 0; i < size; i++)
		scanf("%d", &a[i]);
	
	printf("In reverse order: ");
	for (i = size - 1; i >= 0; i--)
		printf("%d ", a[i]);
	printf("\n");
	
	return 0;
}