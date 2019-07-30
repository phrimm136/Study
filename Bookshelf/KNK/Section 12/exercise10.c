#include <stdio.h>

int *find_middle(int a[], int n);

int main()
{
	int arr1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	
	printf("%d", *(find_middle(arr1, 10)));
	
	return 0;
}

int *find_middle(int a[], int n)
{
	return a + n / 2;
}