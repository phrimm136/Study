#include <stdio.h>
#include <stdlib.h>

struct node 
{
	int value;
	struct node *next;
};

struct node *delete_from_list(struct node *list, int n);

int main(void)
{
	struct node *new, *list = NULL;
	
	for (int i = 10; i >= 1; i--)
	{
		new = malloc(sizeof(struct node));
		new->value = i;
		new->next = list;
		list = new;
	}
	
	list = delete_from_list(list, 1);
	
	for (struct node *i = list; i != NULL; i = i->next)
		printf("%d ", i->value);

	return 0;
}

struct node *delete_from_list(struct node *list, int n)
{
	struct node *cur;
	
	if (list->value == n)
		return list->next;
	for (cur = list; cur->next != NULL && cur->next->value != n; cur = cur->next)
		;
	if (cur->next == NULL)
		return list;
	else
		cur->next = cur->next->next;
	return list;
}