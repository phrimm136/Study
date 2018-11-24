#include <stdio.h>
#include "queue.h"

int main(void)
{
	int n;
	
	for (int i = 1; i <= 10; i++)
		insert_queue(i);
	
	n = return_last();
	printf("Popped %d from last of queue\n", n);
	n = return_first();
	printf("Popped %d from first of queue\n", n);
	remove_queue();
	n = return_first();
	printf("Popped %d from first of queue\n", n);
	insert_queue(n);
	n = return_last();
	printf("Popped %d from last of queue\n", n);
	
	return 0;
}