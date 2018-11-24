#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define NAME_LEN 25

struct part
{
	int number;
	char name[NAME_LEN+1];
	int on_hand;
} *inventory;

int num_parts = 0;
int current_parts = 10;

int read_line(char str[], int n);
int find_part(int number);
void insert(void);
void search(void);
void update(void);
void print(void);

int main(void)
{
	char code;
	
	inventory = malloc(10 * sizeof(struct part));
	
	for(;;)
	{
		printf("Enter operation code: ");
		scanf(" %c", &code);
		while (getchar() != '\n')
			;
		switch (code)
		{
			case 'i': insert(); break;
			case 's': search(); break;
			case 'u': update(); break;
			case 'p': print(); break;
			case 'q': return 0;
			default:  printf("Illegal code\n");
		}
		printf("\n");
	}
}

int read_line(char str[], int n)
{
	int ch, i = 0;
	
	while (isspace(ch = getchar()))
		;
	while ((ch != '\n' && ch != EOF))
	{
		if (i < n)
			str[i++] = ch;
		ch = getchar();
	}
	str[i] = '\0';
	return i;
}

int find_part(int number)
{
	for (int i = 0; i < num_parts; i++)
		if (inventory[i].number == number)
			return i;
	return -1;
}

void insert(void)
{
	int part_number;
	
	if (num_parts > current_parts)
	{
		current_parts *= 2;
		realloc(inventory, current_parts * sizeof(struct part));
	}
	
	printf("Enter part number: ");
	scanf("%d", &part_number);
	if (find_part(part_number) >= 0)
	{
		printf("Part already exists.\n");
		return;
	}
	
	inventory[num_parts].number = part_number;
	printf("Enter part name: ");
	read_line(inventory[num_parts].name, NAME_LEN);
	printf("Enter quantity on hand: ");
	scanf("%d", &inventory[num_parts].on_hand);
	num_parts++;
}

void search(void)
{
	int i, number;
	
	printf("Enter part number: ");
	scanf("%d", &number);
	i = find_part(number);
	if (i >= 0)
	{
		printf("Part name: %s\n", inventory[i].name);
		printf("Quantity on hand: %d\n", inventory[i].on_hand);
	}
	else
		printf("Part not found.\n");
}

void update(void)
{
	int i, number, change;
	
	printf("Enter part number: ");
	scanf("%d", &number);
	i = find_part(number);
	if (i >= 0)
	{
		printf("Enter change in quantity on hand: ");
		scanf("%d", &change);
		inventory[i].on_hand += change;
	}
	else
		printf("Page not found.\n");
}

void print(void)
{
	int i;
	
	printf("Part Number    Part Name                Quantity on Hand\n");
	for (i = 0; i < num_parts; i++)
		printf("%7d        %-25s%1ld\n", inventory[i].number, inventory[i].name, inventory[i]. on_hand);
}