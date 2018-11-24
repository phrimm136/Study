#include <stdio.h>

int main()
{
	int temperatures[7][24] = {0}, *p;
	
	for (int i = 0; i < 7; i++)
	{
		for (p = temperatures[i]; p < temperatures[i] + 24; p++)
			printf("%d ", *p);
		printf("\n");
	}
	
	return 0;
}