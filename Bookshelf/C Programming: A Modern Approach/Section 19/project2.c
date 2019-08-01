#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "stackADT.h"

void RPN_expression(void);
void calculate(Stack s, char operator);
void print_value(int calculated);
void error(int error_code);

int main(void)
{
	for(;;)
		RPN_expression();
	
	return 0;
}

void RPN_expression(void)
{
	char ch;
	Stack s = create();
	
	printf("Enter an RPN expression: ");
	for(;;)
	{
		scanf(" %c", &ch);
		switch (ch)
		{
			case '0' : case '1' : case '2' : case '3' : case '4' : case '5' : case '6' : case '7' : case '8' : case '9':
			push(s, ch - '0'); break;
			case '+' : case '-' : case '*' : case '/':
			calculate(s, ch); break;
			case '=' : printf("Value of expression: %d\n", pop(s)); make_empty(s); return;
			case 'q' : exit(0);
		}
	}
}

void calculate(Stack s, char operator)
{
	int operand1, operand2, calculated = 0;
	
	operand2 = pop(s);
	operand1 = pop(s);
	
	if (operator == '+')
	{
		calculated = operand1 + operand2;
		push(s, calculated);
	}
	if (operator == '-')
	{
		calculated = operand1 - operand2;
		push(s, calculated);
	}
	if (operator == '*')
	{
		calculated = operand1 * operand2;
		push(s, calculated);
	}
	if (operator == '/')
	{
		calculated = operand1 / operand2;
		push(s, calculated);
	}
}