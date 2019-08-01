#include <stdio.h>
#include <stdlib.h>

struct node
{
	int value;
	struct node *next;
};

int count_occurrences(struct node *list, int n);

int main(void)
{
	struct node *list = NULL, *new_node;
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
		new_node->next = list;
		list = new_node;
	}
	printf("Enter number to find its count: ");
	scanf("%d", &find_number);
	
	printf("The count of %d is %d", find_number, count_occurrences(list, find_number));
		
	return 0;
}

int count_occurrences(struct node *list, int n)
{
	struct node *find;
	int count = 0;
	
	for (find = list; find != NULL; find = find->next)
		if (find->value == n)
			count++;
		
	return n;
}