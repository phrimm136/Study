#include <stdio.h>
#include <stdlib.h>
#include "project5_queueADT.h"

#define QUEUE_SIZE 100

struct queue_type
{
	int contents[QUEUE_SIZE];
	int first, number, last;
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
	
	q->first = 0;
	q->number = 0;
	q->last = 0;
	
	return q;
}

void destroy(Queue q)
{
	free(q);
}

void insert_queue(Queue q, int i)
{
	if (q->number > QUEUE_SIZE)
		printf("Error in insert: queue is full.");
	else
	{
		q->contents[q->last] = i;
		q->last = (q->last + 1) % 100;
		q->number++;
	}
}

void remove_queue(Queue q)
{
	if (is_empty_queue(q))
		printf("Error in remove: queue is empty.");
	else
	{
		q->first = (q->first + 1) % 100;
		q->number--;
	}
}

int return_first(Queue q)
{
	return q->contents[q->first];
}

int return_last(Queue q)
{
	return q->contents[q->last-1];
}

bool is_empty_queue(Queue q)
{
	return q->number == 0;
}