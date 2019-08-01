#include <stdio.h>

int main(void)
{
	unsigned int n = 123;
	
	for (; n != 0;)
	{
		n &= n - 1;
		printf("%d (0x%X)\n", n, n);
	}
	
	return 0;
}