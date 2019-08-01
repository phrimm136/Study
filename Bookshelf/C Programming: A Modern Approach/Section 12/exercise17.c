#include <stdio.h>

#define LEN 10

int sum_two_dimensional_array(const int *a, int n);

int main()
{
	int arr[10][LEN] = {1, 2};
	
	printf("%d", sum_two_dimensional_array(arr, 10));
	
	return 0;
}

int sum_two_dimensional_array(const int *a, int n)
{
	int *p, sum = 0;
	
	for (p = a; p < a + LEN * n; p++)
		sum += *p;
	
	return sum;
}