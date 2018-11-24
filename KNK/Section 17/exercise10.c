#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NAME_LEN 100

struct part 
{
	int number;
	char name[NAME_LEN+1];
	int on_hand;
};

void print_part(struct part *p);

int main(void)
{
	struct part *p;

	p = malloc(sizeof(struct part));
	p->number = 1;
	strcpy(p->name, "something");
	p->on_hand = 1234;
	
	print_part(p);
	
	return 0;
}

void print_part(struct part *p)
{
	printf("Part number: %d\n", p->number);
	printf("Part name: %s\n", p->name);
	printf("Quantity on hand: %d\n", p->on_hand);
}