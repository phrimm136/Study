#include <stdio.h>
#include "project5_queueADT.h"

int main(void)
{
	Queue q1, q2;
	int n;
	
	q1 = create_queue();
	q2 = create_queue();
	
	insert_queue(q1, 1);
	insert_queue(q1, 2);
	insert_queue(q1, 3);
	insert_queue(q1, 4);
	
	n = return_first(q1);
	printf("Returned %d from first of q1\n", n);
	remove_queue(q1);
	insert_queue(q2, n);
	n = return_first(q1);
	printf("Returned %d from first of q1\n", n);
	remove_queue(q1);
	n = return_last(q1);
	printf("Returned %d from last of q1\n", n);
	insert_queue(q2, n);
	
	destroy(q1);
	
	while (!is_empty_queue(q2))
	{
		printf("Returned %d from first of q2\n", return_first(q2));
		remove_queue(q2);
	}
	
	insert_queue(q2, 3);
	
	destroy(q2);
	
	return 0;
}