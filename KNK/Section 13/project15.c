#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define STACK_SIZE 100

int contents[STACK_SIZE];
int top = 0;

void make_empty(void);
bool is_empty(void);
bool is_full(void);
void push(char i);
char pop(void);
void stack_overflow(void);
void stack_underflow(void);
int evaluate_RPN_expression(const char *expression);
void calculate(char operator);

int main(void)
{
	char expression[STACK_SIZE * 2];
	for(;;)
	{
		printf("Enter an RPN expression: ");
		gets(expression);
		printf("Value of expression: %d\n", evaluate_RPN_expression(expression));
	}
	
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


int evaluate_RPN_expression(const char *expression)
{
	for(int i = 0;;i++)
	{
		
		switch (expression[i])
		{
			case '0' : case '1' : case '2' : case '3' : case '4' : case '5' : case '6' : case '7' : case '8' : case '9':
			push(expression[i] - '0'); break;
			case '+' : case '-' : case '*' : case '/':
			calculate(expression[i]); break;
			case '=' : make_empty(); return contents[0];
			case 'q' : exit(0);
		}
	}
}

void calculate(char operator)
{
	int operand1, operand2, calculated = 0;
	
	operand2 = pop();
	operand1 = pop();
	
	if (operator == '+')
	{
		calculated = operand1 + operand2;
		push(calculated);
	}
	if (operator == '-')
	{
		calculated = operand1 - operand2;
		push(calculated);
	}
	if (operator == '*')
	{
		calculated = operand1 * operand2;
		push(calculated);
	}
	if (operator == '/')
	{
		calculated = operand1 / operand2;
		push(calculated);
	}
}

void stack_overflow(void)
{
	printf("Expression is too complex");
	exit(0);
}

void stack_underflow(void)
{
	printf("Not enough operands in expression");
	exit(0);
}