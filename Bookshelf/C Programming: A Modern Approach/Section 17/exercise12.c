#include <stdio.h>
#include <stdlib.h>

struct node
{
	int value;
	struct node *next;
};

struct node *find_last(struct node *list, int n);

int main(void)
{
	struct node *list = NULL, *new_node, *last, *temp;
	int find_number;
	
	printf("Enter a series of numbers (0 to end input): ");
	for(;;)
	{
		int number;
		
		scanf("%d", &number);
		if (number == 0)
			break;
		
		new_node = malloc(sizeof(struct node));
		new_node->value = number;
		new_node->next = NULL;
		if (list == NULL)
			list = new_node;
		else
		{
			for (temp = list; temp->next != NULL; temp = temp->next)
				;
			temp->next = new_node;
		}
	}
	printf("Enter number to find last node of it: ");
	scanf("%d", &find_number);
	last = find_last(list, find_number);
	
	if (last != NULL)
	{
		printf("The next node of the last node of %d is ", find_number);
		if (last->next == NULL)
			printf("NULL");
		else
			printf("%d", last->next->value);
	}
	else
		printf("There is no node of %d", find_number);
		
	return 0;
}

struct node *find_last(struct node *list, int n)
{
	struct node *last = NULL, *find;
	
	for (find = list; find != NULL; find = find->next)
		if (find->value == n)
			last = find;
	
	return last;
}