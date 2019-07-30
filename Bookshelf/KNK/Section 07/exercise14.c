#include <stdio.h>

int main()
{
	float f = 12345678901234.5678f; // if float value exceeds the lange of int, no
	float frac_part = f - (int) f;
	
	printf("%f", frac_part);
	
	return 0;
}