#include <stdio.h>
#include <stdbool.h>

#define STACK_SIZE 100

int contents[STACK_SIZE];
int *ptr_top = &contents[0];

void make_empty(void);
bool is_empty(void);
bool is_full(void);
void push(int i);
int pop(void);

int main()
{
	
	
	return 0;
}

void make_empty(void)
{
	ptr_top = &contents[0];
}

bool is_empty(void)
{
	return ptr_top == &contents[0];
}

bool is_full(void)
{
	return ptr_top == &contents[STACK_SIZE];
}

void push(int i)
{
	if (is_full())
		stack_overflow();
	else
		*(ptr_top++) = i;
}

int pop(void)
{
	if (is_empty())
		stack_underflow;
	else
		return *(--ptr_top);
}