#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define STACK_SIZE 100

char contents[STACK_SIZE];
int top = 0;

void make_empty(void);
bool is_empty(void);
bool is_full(void);
void push(char i);
char pop(void);
void enter_parentheses_and_braces(void);
void nest_verification(void);
void stack_underflow(void);
void stack_overflow(void);
void not_nested(void);

int main(void)
{
	enter_parentheses_and_braces();
	nest_verification();
	
	return 0;
}

void make_empty(void)
{
	top = 0;
}

bool is_empty(void)
{
	return top == 0;
}

bool is_full(void)
{
	return top == STACK_SIZE;
}

void push(char i)
{
	if (is_full())
		stack_overflow();
	else
		contents[top++] = i;
}

char pop(void)
{
	if (is_empty())
		stack_underflow();
	else
		return contents[--top];
}

void enter_parentheses_and_braces(void)
{
	char input;
	
	printf("Enter parentheses and/or braces: ");
	for (;;)
	{
		input = getchar();
		if (input == '\n')
			break;
		if (input == '(' || input == '{')
			push(input);
		if ((contents[top - 1] == '(' && input == ')') || (contents[top - 1] == '{' && input == '}'))
			pop();
	}
}

void nest_verification()
{
	if (is_empty())
	{
		printf("Parentheses/braces are nested properly");
		exit(0);
	}
	else
		not_nested();
}

void stack_underflow(void)
{
	not_nested();
}

void stack_overflow(void)
{
	printf("Stack overflow");
	exit(0);
}

void not_nested(void)
{
	printf("Parentheses/braces are not nested properly");
	exit(0);
}