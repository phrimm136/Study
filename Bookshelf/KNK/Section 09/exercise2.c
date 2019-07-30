#include <stdio.h>

int check(int x, int y, int n);

int main()
{
	int x, y, n;
	
	scanf("%d %d %d", &x, &y, &n);
	
	printf("%d", check(x, y, n));
	
	return 0;
}

int check(int x, int y, int n)
{
	return ((x >= 0 && x <= (n - 1)) && (y >= 0 && y <= (n - 1)));
}