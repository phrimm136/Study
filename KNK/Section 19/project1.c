#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "stackADT.h"

Stack enter_parentheses_and_braces(void);
void nest_verification(Stack s);
void not_nested(void);

int main(void)
{
	Stack s;
	s = enter_parentheses_and_braces();
	nest_verification(s);
	
	return 0;
}

Stack enter_parentheses_and_braces(void)
{
	char input, temp;
	Stack s = create();
	
	printf("Enter parentheses and/or braces: ");
	for (;;)
	{
		input = getchar();
		if (input == '\n')
			break;
		if (input == '(' || input == '{')
			push(s, input);
		temp = pop(s);
		if ((temp == '(' && input == ')') || (temp == '{' && input == '}'))
			;
		else
			push(s, temp);
	}
	
	return s;
}

void nest_verification(Stack s)
{
	if (is_empty(s))
	{
		printf("Parentheses/braces are nested properly");
		exit(0);
	}
	else
		not_nested();
}

void not_nested(void)
{
	printf("Parentheses/braces are not nested properly");
	exit(0);
}