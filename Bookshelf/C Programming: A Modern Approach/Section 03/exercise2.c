#include <stdio.h>

int main()
{
	printf("%-8.1e\n", 12.345678);
	printf("%10.6e\n", 12.345678);
	printf("%-8.3f\n", 12.345678);
	printf("%6.0f\n", 12.345678);
	
	return 0;
}