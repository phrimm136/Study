#include <stdio.h>

int main()
{
	int i;
		
	i = 10;
	
	while (i >= 1)
	{
		printf("%d ", i++);
		i /= 2;
	}
	
	return 0;
}