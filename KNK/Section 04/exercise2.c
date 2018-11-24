#include <stdio.h>

int main()
{
	int i, j;
	
	i = 5, j = 3;
	printf("%d %d\n", (-i) / j , -(i / j));
	
	i = 3, j = 5;
	printf("%d %d\n", (-i) / j , -(i / j));
	
	return 0;
}