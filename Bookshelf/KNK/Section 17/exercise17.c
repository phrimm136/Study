#include <stdio.h>

void qsort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *));

int main(void)
{
	int a[100];
	
	qsort(a[50], 50, sizeof(a[0]), compare);
	
	return 0;
}

