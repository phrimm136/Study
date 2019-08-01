#include <stdio.h>
#include <stdlib.h>

void test1(void);
void test2(void);

int main(void)
{
	atexit(test2);
	atexit(test1);
	
	return 0;
}

void test1(void)
{
	printf("That's all, ");
}

void test2(void)
{
	printf("folks!");
}