#include <stdio.h>

int main()
{
	int n, facto;
	double e = 1;
	
	scanf("%d", &n);
	
	for (int i = 1; i <= n; i++)
	{
		facto = 1;
		for (int j = 1; j <= i; j++)
			facto *= j;
		e += 1.0 / facto;
	}
	
	printf("e: %g", e);
	
	return 0;
}