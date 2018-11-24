#include <stdio.h>

int main()
{
	int i = 1, j = 2;
	
	i += j;
	printf("%d\n", i);
	i--;
	printf("%d\n", i);
	i = i * j / i;
	printf("%d\n", i);
	i = i % ++j;
	printf("%d\n", i);
	
	return 0;
}