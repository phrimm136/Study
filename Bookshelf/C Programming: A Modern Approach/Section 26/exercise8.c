#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
	int n;
	
	srand((unsigned) time(NULL));
	for (;;)
	{
		n = rand();
		
		if (n == 7 || n == 11 || n == 15 || n == 19)
			break;
	}
	
	printf("%d", n);
	
	return 0;
}