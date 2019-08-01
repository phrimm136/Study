#include <stdio.h>
#include <stdlib.h>
#include "project7_queueADT.h"

struct node
{
	int value;
	struct node *next;
};

struct queue_type
{
	struct node *first, *last;
};

static void terminate(const char *message)
{
	printf("%s\n", message);
	exit(EXIT_FAILURE);
}

Queue create_queue(void)
{
	Queue q = malloc(sizeof(struct queue_type));
	if (q == NULL)
		terminate("Error in create: stack could not be created.");
	q->first = NULL;
	q->last = NULL;
	return q;
}

void destroy(Queue q)
{
	free(q);
}

void insert_queue(Queue q, int i)
{
	struct node *new_node = malloc(sizeof(struct node));
	if (new_node == NULL)
		terminate("Error in insert: queue is full.");
	else
	{
		new_node->value = i;
		new_node->next = NULL;
		if (q->first == NULL)
		{
			q->last = new_node;
			q->first = new_node;
		}
		else
		{
			q->last->next = new_node;
			q->last = q->last->next;
		}
	}
}

void remove_queue(Queue q)
{
	if (is_empty_queue(q))
		terminate("Error in remove: queue is empty.");
	else
	{
		struct node *old_first = q->first;
		q->first = q->first->next;
		free(old_first);
	}
}

int return_first(Queue q)
{
	return q->first->value;
}

int return_last(Queue q)
{
	return q->last->value;
}

bool is_empty_queue(Queue q)
{
	return q->first == NULL;
}