#include <stdio.h>

#define N 10

void find_two_largest(int a[], int n, int *largest, int *second_largest);

int main(void)
{
	int a[N], largest, second_largest;
	
	printf("Enter a %d numbers: ", N);
	for(int i = 0; i < N; i++)
		scanf("%d", &a[i]);
	
	find_two_largest(a, N, &largest, &second_largest);
	
	printf("The first largest number is %d, and the second largest number is %d", largest, second_largest);
	
	return 0;
}

void find_two_largest(int a[], int n, int *largest, int *second_largest)
{
	if (a[0] > a[1])
	{
		*largest = a[0];
		*second_largest = a[1];
	}
	else 
	{
		*largest = a[1];
		*second_largest = a[0];
	}
	for (int i = 2; i < n; i++)
	{
		if (*largest < a[i])
		{
			*second_largest = *largest;
			*largest = a[i];
		}
		else if (*largest > a[i] && *second_largest < a[i])
			*second_largest = a[i];
	}
}