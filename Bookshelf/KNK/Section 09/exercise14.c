#include <stdio.h>
#include <stdbool.h>

bool has_zero(int a[], int n);

int main()
{
	int a[] = {1, 2, 3, 4}, size = (int) sizeof(a) / sizeof(a[0]);
	
	printf(has_zero(a, size) ? "true" : "false");
	
	return 0;
}

bool has_zero(int a[], int n)
{
	for (int i = 0; i < n; i++)
		if (a[i] == 0)
			return true;
	return false;
}