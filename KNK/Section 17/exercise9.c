#include <stdio.h>

struct ex {int a;};

int main(void)
{
	struct ex x;
	
	x.a = 7;
	
	printf("%d %d", x.a, (&x)->a); // same
		
	return 0;
}