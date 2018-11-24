#include <stdio.h>

typedef __int8 Int8;
typedef __int16 Int16;
typedef __int32 Int32;

int main()
{
	Int8 a = 300;
	Int16 b = 40000;
	Int32 c = 5000000000;
	
	printf("%d %d %d", a, b, c);
	
	return 0;
}