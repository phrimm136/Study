#include <stdio.h>

struct IEEE_float
{
	unsigned int fraction: 23;
	unsigned int exponent: 8;
	unsigned int sign: 1;
};