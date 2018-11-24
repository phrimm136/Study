#include <stdio.h>

#define ERROR(str, index) fprintf(stderr, str, (index))

int main(void)
{	
	int index = 0;
	ERROR("Range error: index = %d\n", index);
	
	return 0;
}