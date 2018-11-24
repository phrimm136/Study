#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
	int sum = 0;
	for (int i = argc - 1; i >= 1; i--)
		sum += atoi(argv[i]);
	
	printf("Total: %d", sum);
	
	return 0;
}