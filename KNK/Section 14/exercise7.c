#include <stdio.h>

#define GENERIC_MAX(type)		\
type type##_max(type x, type y) \
{								\
	return x > y ? x : y;		\
}

typedef unsigned long ULONG;

GENERIC_MAX(ULONG)

int main(void)
{	
	unsigned long x = 12, y = 15;
	
	printf("%lu", ULONG_max(x, y));
	
	return 0;
}