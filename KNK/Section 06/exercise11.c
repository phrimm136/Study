#include <stdio.h>

int main()
{
	int i, sum;
	
	sum = 0;
	for(i = 0; i < 10; i++)
	{
		if (i % 2)
			continue;
		sum += i;
	}
	printf("%d\n", sum);
	
	return 0;
}