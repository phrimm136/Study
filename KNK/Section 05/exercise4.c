#include <stdio.h>

int main()
{
	int i, j;
	
	i = 2; j = 3;
	printf("%d\n", (i > j) - (i < j));
	
	i = 4; j = 4;
	printf("%d\n", (i > j) - (i < j));
	
	i = 6; j = 5;
	printf("%d\n", (i > j) - (i < j));
	
	return 0;
}