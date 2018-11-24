#include <stdio.h>
#include <stdlib.h>

void *my_malloc(size_t n);

int main(void)
{
	int n = 0;
	char *p;
	
	printf("Enter number to malloc memory you want: ");
	scanf("%d", &n);
	p = my_malloc(n + 1);
	
	printf("Enter a string up to %d length(s) : ", n);
	scanf("%s", p);
	
	printf("You entered string \"%s\"", p);
	
	return 0;
}

void *my_malloc(size_t n)
{
	void *p = malloc(n);
	
	if (p != NULL)
		return p;
	else
	{
		printf("malloc failed\n");
		exit(1);
	}
}