#include <stdio.h>

union
{
	float f;
	struct IEEE_float
	{
		unsigned int fraction: 23;
		unsigned int exponent: 8;
		unsigned int sign: 1;
	} s;
} my_float;

int main(void)
{
	my_float.s.sign = 1;
	my_float.s.exponent = 128;
	my_float.s.fraction = 0;
	
	printf("%g", my_float.f);
	
	return 0;
}