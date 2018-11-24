#include <stdio.h>

int main()
{
	printf("%6d,%4d\n", 86, 1040); // |    86,1040|
	printf("%12.5e\n", 30.253); // |3.02530e+001|
	printf("%.4f\n", 83.162); // |83.1620|
	printf("%-6.2g\n", .0000009979); //|1e-006|
	
	return 0;
}