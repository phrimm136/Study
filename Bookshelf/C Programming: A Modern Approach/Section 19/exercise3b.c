#include <stdio.h>
#include <stdlib.h>
#include "queue.h"

#define QUEUE_SIZE 100

struct node
{
	int value;
	struct node *next;
};

static struct node *first = NULL, *last = NULL;

void insert_queue(int i)
{
	struct node *new_node = malloc(sizeof(struct node));
	if (new_node == NULL)
		printf("Error in insert: queue is full.");
	else
	{
		new_node->value = i;
		new_node->next = NULL;
		if (first == NULL)
		{
			last = new_node;
			first = new_node;
		}
		else
		{
			last->next = new_node;
			last = last->next;
		}
	}
}

void remove_queue(void)
{
	if (is_empty_queue())
		printf("Error in remove: queue is empty.");
	else
	{
		struct node *old_first = first;
		first = first->next;
		free(old_first);
	}
}

int return_first(void)
{
	return first->value;
}

int return_last(void)
{
	return last->value;
}

bool is_empty_queue(void)
{
	return first == NULL;
}