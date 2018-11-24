#include <stdio.h>

void swap(int *p, int *q);

int main(void)
{
	int p, q;
	
	scanf("%d %d", &p, &q);
	
	swap(&p, &q);
	
	printf("%d %d", p, q);
	
	return 0;
}

void swap(int *p, int *q)
{
	int tmp = *p;
	*p = *q;
	*q = tmp;
}