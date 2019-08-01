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
void RPN_expression(void);
void calculate(char operator);
void print_value(int calculated);
void error(int error_code);
void stack_overflow(void);
void stack_underflow(void);

int main(void)
{
	for(;;)
		RPN_expression();
	
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


void RPN_expression(void)
{
	char ch;
	
	printf("Enter an RPN expression: ");
	for(;;)
	{
		scanf(" %c", &ch);
		switch (ch)
		{
			case '0' : case '1' : case '2' : case '3' : case '4' : case '5' : case '6' : case '7' : case '8' : case '9':
			push(ch - '0'); break;
			case '+' : case '-' : case '*' : case '/':
			calculate(ch); break;
			case '=' : printf("Value of expression: %d\n", contents[0]); make_empty(); return;
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