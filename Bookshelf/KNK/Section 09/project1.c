#include <stdio.h>

void selection_sort(int a[], int n);

int main()
{
	int a[10] = {0};
	
	printf("Enter ten integers: ");
	for (int i = 0; i < 10; i++)
		scanf("%d", &a[i]);
	
	selection_sort(a, 10);
	
	return 0;
}

void selection_sort(int a[], int n)
{
	int max = a[0], tmp, idx = 0;
	
	for (int i = 0; i < n; i++)
	{
		if (max < a[i])
		{
			max = a[i];
			idx = i;
		}
	}
	
	tmp = a[n - 1];
	a[n - 1] = a[idx];
	a[idx] = tmp;
	
	if (n != 1)
		selection_sort(a, n - 1);
	else
		for (int i = 0; i < 10; i++)
			printf("%d ", a[i]);
}