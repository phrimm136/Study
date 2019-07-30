#include <stdio.h>
#include <stdlib.h>
#include "exercise4_stack.h"

#define STACK_SIZE 100

static struct stack_type
{
	int contents[STACK_SIZE];
	int top = 0;
};

static void terminate(const char *message)
{
	printf("%s\n", message);
	exit(EXIT_FAILURE);
}

void make_empty(Stack *s)
{
	s->top = 0;
}

bool is_empty(Stack *s)
{
	return s->top == 0;
}

bool is_full(Stack *s)
{
	return s->top == STACK_SIZE;
}

void push(Stack *s, int i)
{
	if (is_full())
		terminate("Error in push: stack is full.");
	s->contents[s->top++] = i;
}

int pop(Stack *s)
{
	if (is_empty())
		terminate("Error in pop: stack is empty.");
	return s->contents[--s->top];
}