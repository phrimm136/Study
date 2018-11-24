#include <stdio.h>

int find_largest(const int a[], int n);

int main()
{
	int arr1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	
	printf("%d", find_largest(arr1, 10));
	
	return 0;
}

int find_largest(const int a[], int n)
{
	int largest = *a;
	
	for (int *p = a + 1; p < a + n; p++)
		if (largest < *p)
			largest = *p;
		
	return largest;
}