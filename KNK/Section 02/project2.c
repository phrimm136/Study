#include <stdio.h>
#define PI 3.141592

int main()
{
	int r = 10, v = 4.0f / 3.0f * r * r * r * PI;
	
	printf("%d\n", v);
	
	return 0;
}