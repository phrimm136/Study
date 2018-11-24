#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct part
{
	int number;
	char name[20+1];
	int on_hand;
}
inventory[10];

int compare_parts(const void *p, const void *q);

int main(void)
{
	for (int i = 0; i < 10; i++)
	{
		inventory[i].number = (i + 1);
		strcpy(inventory[i].name, "1234");
		inventory[i].on_hand = (i + 1) * 99;
	}
	
	qsort(inventory, 10, sizeof(struct part), compare_parts);
	
	for (int i = 0; i < 10; i++)
		printf("%d %s %d\n", inventory[i].number, inventory[i].name, inventory[i].on_hand);
	
	return 0;
}

int compare_parts(const void *p, const void *q)
{
	return ((struct part *) q)->number - ((struct part *) p)->number;
}