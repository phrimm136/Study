#include <stdio.h>

#define NELEMS(a) ((int) sizeof(a) / sizeof(a[0]))

int main()
{
	int a[10];
	
	printf("%d", NELEMS(a));
	
	return 0;
}