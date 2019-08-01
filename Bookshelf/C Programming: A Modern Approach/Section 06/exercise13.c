#include <stdio.h>

int main()
{
	int n, m;
	
	scanf("%d", &m);
	
	for (n = 0; m > 0; n++, m /= 2);
	
	printf("%d %d", n, m);
	
	return 0;
}