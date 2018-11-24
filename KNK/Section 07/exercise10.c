#include <stdio.h>

int main()
{
	int i = 10;
	long j = 9;
	unsigned int k = 8;
	
	printf("%d", i + (int) j * k); // unsigned int
	
	return 0;
}