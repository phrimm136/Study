#include <stdio.h>

int main()
{
	int n, facto;
	double e = 1, epsilon;
	
	scanf("%d", &n);
	scanf("%lf", &epsilon);
	
	for (int i = 1; i <= n; i++)
	{
		facto = 1;
		for (int j = 1; j <= i; j++)
			facto *= j;
		e += 1.0 / facto;
		if (1.0 / facto < epsilon)
			break;
	}
	
	printf("e: %g", e);
	
	return 0;
}