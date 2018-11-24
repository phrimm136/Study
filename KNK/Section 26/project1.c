#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
	srand((unsigned) time(NULL));
	
	for (int i = 0; i < 1000; i++)
		printf("%d", rand() & 1);
	
	return 0;
}