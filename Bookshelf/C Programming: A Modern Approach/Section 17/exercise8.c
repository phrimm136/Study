#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

struct node {int value; struct node *next;};

struct node *list = NULL;

void make_empty(void);
bool is_empty(void);
bool push(int i);
int pop(void);
void RPN_expression(void);
void calculate(char operator);
void stack_overflow(void);
void stack_underflow(void);

int main(void)
{
	for(;;)
		RPN_expression();
}

void make_empty(void)
{
	struct node *tmp;
	
	while(list != NULL)
	{
		tmp = list;
		list = list->next;
		free(tmp);
	}
}

bool is_empty(void)
{
	return list == NULL;
}

bool push(int i)
{
	struct node *new;
	
	new = malloc(sizeof(struct node));
	if(new == NULL)
		return false;
	
	new->value = i;
	new->next = list;
	list = new;
	
	return true;
}

int pop(void)
{
	int pop_value;
	struct node *prev;
		
	if (is_empty())
		stack_underflow();
	else
	{		
		pop_value = list->value;
		prev = list;
		list = list->next;
		free(prev);
	}
	return pop_value;
}
void RPN_expression(void)
{
	char ch;
	bool check_push;
	
	printf("Enter an RPN expression: ");
	for(;;)
	{
		scanf(" %c", &ch);
		switch (ch)
		{
			case '0' : case '1' : case '2' : case '3' : case '4' : case '5' : case '6' : case '7' : case '8' : case '9':
			check_push = push(ch - '0'); break;
			case '+' : case '-' : case '*' : case '/':
			calculate(ch); break;
			case '=' : printf("Value of expression: %d\n", list->value); make_empty(); return;
			case 'q' : exit(0);
		}
		if (check_push == false)
			stack_overflow();
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
	exit(1);
}

void stack_underflow(void)
{
	printf("Not enough operands in expression");
	exit(1);
}