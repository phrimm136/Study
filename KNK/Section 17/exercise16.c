#include <stdio.h>

int sum(int (*f)(int), int start, int end);
int square(int i);

int main(void)
{
	printf("%d\n", sum(square, 1, 10));
	
	return 0;
}

int sum(int (*f)(int), int start, int end)
{
	int f_sum = 0;
	for (int i = start; i <= end; i++)
	{
		f_sum += (*f)(i);
	}
	
	return f_sum;
}

int square(int i)
{
	return i * i;
}