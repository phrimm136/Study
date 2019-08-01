#include <stdio.h>

int power(int x, int n);

int main()
{
	int x, n;
	
	printf("Enter two integers (x ^ n): ");
	scanf("%d %d", &x, &n);
	
	printf("%d ^ %d = %d", x, n, power(x, n));
	
	return 0;
}

int power(int x, int n)
{
	if (n == 0)
		return 1;
	else if (n % 2 == 0)
		return power(x * x, n / 2);
	else
		return x * power(x, n - 1);
}