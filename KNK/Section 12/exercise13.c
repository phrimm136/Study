#include <stdio.h>

#define N 10

int main()
{
	double iden[N][N];
	double *p;
	
	for (p = &iden[0][0]; p <= &iden[N-1][N-1]; p++)
	{
		if ((p - &iden[0][0]) % (N + 1) == 0)
			*p = 1.0;
		else
			*p = 0.0;
		
	}
	
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
			printf("%g ", iden[i][j]);
		printf("\n");
	}
	
	return 0;
}
