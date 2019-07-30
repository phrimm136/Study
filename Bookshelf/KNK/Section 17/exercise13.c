#include <stdio.h>
#include <stdlib.h>

struct node
{
	int value;
	struct node *next;
};

struct node *insert_into_ordered_list(struct node *list, struct node *new_node);

int main(void)
{
	struct node *list = NULL, *new_node, *temp;
	int number;
	
	printf("Enter a series of numbers (0 to end input): ");
	for(;;)
	{
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
			list = insert_into_ordered_list(list, new_node);
		}
	}
	
	for (temp = list; temp != NULL; temp = temp->next)
		printf("%d ", temp->value);
	
	return 0;
}

struct node *insert_into_ordered_list(struct node *list, struct node *new_node)
{
	struct node *cur = list, *prev = NULL;
	
	while (cur != NULL && cur->value <= new_node->value)
	{
		prev = cur;
		cur = cur->next;
	}
	if (prev == NULL)
	{
		new_node->next = cur;
		list = new_node;
	}
	else
	{
		prev->next = new_node;
		new_node->next = cur;
	}
	
	return list;
}