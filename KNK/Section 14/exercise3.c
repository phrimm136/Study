#include <stdio.h>

#define DOUBLE(x) 2*x

int main()
{	
	printf("%d %d\n", DOUBLE(1 + 2), 4 / DOUBLE(2));
	
	#undef DOUBLE
	#define DOUBLE(x) (2*(x))
	
	printf("%d %d\n", DOUBLE(1 + 2), 4 / DOUBLE(2));
	
	return 0;
}