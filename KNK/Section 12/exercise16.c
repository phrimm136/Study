#include <stdio.h>

int find_largest(int a[][24], int n);

int main()
{
	int temperatures[7][24] = {0};
	
	printf("%d", find_largest(temperatures, 7 * 24));
	
	return 0;
}

int find_largest(int a[][24], int n)
{
	int largest = *a[0];
	
	for (int *p = &a[0][0] + 1; p < &a[0][0] + n; p++)
		if (largest < *p)
			largest = *p;
		
	return largest;
}