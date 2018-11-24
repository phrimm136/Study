#include <stdio.h>

int main()
{
	int d, n;
	
	scanf("%d", &n);
	
	for (d = 2; d * d < n; d++)
		if(n % d == 0)
			break;
		
	if (d * d > n)
		printf("Prime\n");
	else
		printf("Composite\n");
	
	return 0;
}