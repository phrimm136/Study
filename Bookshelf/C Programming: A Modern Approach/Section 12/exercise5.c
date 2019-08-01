#include <stdio.h>

int main()
{
	int a[10] = {0}, *p = a;
	
	printf("%d %d %d %d", p == a[0], p == &a[0], *p == a[0], p[0] == a[0]);
	
	return 0;
}