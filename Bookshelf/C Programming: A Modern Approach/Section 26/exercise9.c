#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
	double n;
	
	srand((unsigned) time(NULL));
	rand();
	n = (double) rand() / (RAND_MAX + 1);
	
	printf("%f", n);
	
	return 0;
}