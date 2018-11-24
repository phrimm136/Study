#include <stdio.h>
#include <stddef.h>

struct s
{
	char a;
	int b[2];
	float c;
};

int main(void)
{
	printf("size: %d, offset of a: %d, offset of b: %d, offset of c: %d",
			sizeof(struct s), offsetof(struct s, a), offsetof(struct s, b), offsetof(struct s, c));
	
	return 0;
}