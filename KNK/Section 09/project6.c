#include <stdio.h>
#include <math.h>

int polynomial(int x);

int main()
{
	int x;
	
	printf("Enter an integer: ");
	scanf("%d", &x);
	
	printf("%d on 3x^5+2x^4-5x^3-x^2+7x-6 is %d", x, polynomial(x));
	
	return 0;
}

int polynomial(int x)
{
	int sum = 0;
	
	sum += 3 * pow(x, 5) + 2 * pow(x, 4) - 5 * pow(x, 3) - pow(x, 2) + 7 * x - 6;
	
	return sum;
}