#include <stdio.h>

#define N 10

int *find_largest(int a[], int n);

int main(void)
{
	int a[N], *largest;
	
	printf("Enter %d numbers: ", N);
	for (int i = 0; i < 10; i++)
		scanf("%d", &a[i]);
	
	largest = find_largest(a, N);
	
	printf("The largest number is %d", *largest);
	
	return 0;
}

int *find_largest(int a[], int n)
{
	int *largest = &a[0];
	
	for (int i = 1; i < n; i++)
	{
		if (*largest < a[i])
		largest = &a[i];		
	}
	
	return largest;
}