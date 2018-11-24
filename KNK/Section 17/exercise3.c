#include <stdio.h>
#include <stdlib.h>

int *create_array(int n, int initial_value);

int main(void)
{
	int *p;
	
	p = create_array(10, 9);
	
	for (int i = 0; i < 10; i++)
		printf("%d ", p[i]);
	
	return 0;
}

int *create_array(int n, int initial_value)
{
	int *p;
	
	p = malloc(sizeof(int) * n);
	
	if (p == NULL)
		return NULL;
	else
		for (int *i = p; i < p + n; i++)
			*i = initial_value;
	
	return p;
}