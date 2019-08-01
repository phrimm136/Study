#include <stdio.h>

void find_two_largest(const int *a, int n, int *largest, int *second_largest);

int main()
{
	int arr1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, largest, second_largest;
	
	find_two_largest(arr1, 10, &largest, &second_largest);
	
	printf("%d %d", largest, second_largest);
	
	return 0;
}

void find_two_largest(const int *a, int n, int *largest, int *second_largest)
{
	int *p = a;
	
	if (*p > *(p + 1))
	{
		*largest = *p;
		*second_largest = *(p + 1);
	}
	else
	{
		*largest = *(p + 1);
		*second_largest = *p;
	}
	
	for (p = a + 2; p < a + n; p++)
	{
		if (*largest < *p)
		{
			*second_largest = *largest;
			*largest = *p;
		}
		else if (*largest > *p && *second_largest < *p)
			*second_largest = *p;
	}
	
}