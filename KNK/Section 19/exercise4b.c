#include <stdio.h>
#include <stdlib.h>
#include "exercise4_stack.h"

static struct stack_type
{
	int data;
	struct stack_type *next;
};

static void terminate(const char *message)
{
	printf("%s\n", message);
	exit(EXIT_FAILURE);
}

void make_empty(Stack *s)
{
	while (!is_empty(s))
		pop(s);
}

bool is_empty(Stack *s)
{
	return *s->top == NULL;
}

bool is_full(Stack *s)
{
	return false;
}

void push(Stack *s, Item i)
{
	struct stack_type *new_node = malloc(sizeof(struct node));
	if (new_node == NULL)
		terminate("Error in push: stack is full");
	
	new_node->data = i;
	new_node->next = *s;
	*s= new_node;
}

Item pop(Stack *s)
{
	struct stack_type *old_top;
	Item i;
	
	if (is_empty(s))
		terminate("Error in pop: stack is empty.");
	
	old_top = *s;
	i = (*s)->data;
	*s = (*s)->next;
	free(old_top);
	return i;
}