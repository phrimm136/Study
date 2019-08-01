#include <stdio.h>
#include <stdlib.h>

struct node
{
	int value;
	struct node *next;
};

void delete_from_list(struct node **list, int n);

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
			for (temp = list; temp->next != NULL; temp = temp->next)
				;
			temp->next = new_node;
		}
	}
	printf("Enter a number to delete from list: ");
	scanf("%d", &number);
	delete_from_list(&list, number);
	
	for (temp = list; temp != NULL; temp = temp->next)
		printf("%d ", temp->value);
	
	return 0;
}

void delete_from_list(struct node **list, int n)
{
	struct node *cur, *prev;
	
	for (cur = *list, prev = NULL; cur != NULL && cur->value != n; prev = cur, cur = cur->next)
		;
	if (cur == NULL)
	{
		;
	}
	if (prev == NULL)
		*list = (*list)->next;
	else
		prev->next = cur->next;
	free(cur);
}