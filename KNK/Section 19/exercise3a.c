#include <stdio.h>
#include <stdlib.h>
#include "queue.h"

#define QUEUE_SIZE 100

static int contents[QUEUE_SIZE];
static int first = 0, number = 0, last = 0;

void insert_queue(int i)
{
	if (number > QUEUE_SIZE)
		printf("Error in insert: queue is full.");
	else
	{
		contents[last] = i;
		last = (last + 1) % 100;
		number++;
	}
}

void remove_queue(void)
{
	if (is_empty_queue())
		printf("Error in remove: queue is empty.");
	else
	{
		first = (first + 1) % 100;
		number--;
	}
}

int return_first(void)
{
	return contents[first];
}

int return_last(void)
{
	return contents[last-1];
}

bool is_empty_queue(void)
{
	return number == 0;
}