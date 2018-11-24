#include <stdio.h>

int fact(int n);

int main()
{
	int n;
	
	printf("Enter a number to make factorial: ");
	scanf("%d", &n);
	
	printf("%d! = %d", n, fact(n));
	
	return 0;
}

int fact(int n)
{
	int factorial = 1;
	
	for (int i = 1; i <= n; i++)
		factorial *= i;
	
	return factorial;
}