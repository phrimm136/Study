#include <stdio.h>

int main()
{
	int i, j;
	
	i = 5;
	j = (i += 1) * 3 - 2;
	printf("%d %d\n", i, j);
	
	i = 5;
	j = 3 - 2 * (i += 1);
	printf("%d %d\n", i, j);
	
	i = 7;
	j = 3 + (i -= 1) * 2;
	printf("%d %d\n", i, j);
	
	i = 7;
	j = 3 + (i -= 1) * 2;
	printf("%d %d\n", i, j);
	
	return 0;
}