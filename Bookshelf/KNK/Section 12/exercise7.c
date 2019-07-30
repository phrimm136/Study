#include <stdio.h>
#include <stdbool.h>

bool search(const int a[], int n, int key);

int main()
{
	int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	
	printf("%d", search(a, 10, 1));
	
	return 0;
}

bool search(const int a[], int n, int key)
{
	int *p;
	
	for (p = a; p < a + n; p++)
	{
		if (key == *p)
			return true;
	}
	return false;
}