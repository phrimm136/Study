#include <stdio.h>

struct date {int year, month, day;};

void compare_dates(struct date date1, struct date date2);

int main()
{
	struct date date1, date2;
	
	printf("Enter first date (mm/dd/yy): ");
	scanf("%d/%d/%d", &date1.month, &date1.day, &date1.year);
	printf("Enter second date (mm/dd/yy): ");
	scanf("%d/%d/%d", &date2.month, &date2.day, &date2.year);
	
	compare_dates(date1, date2);
	
	return 0;
}

void compare_dates(struct date date1, struct date date2)
{
	if (date1.year < date2.year)
		printf("%d/%d/%.2d is earlier than %d/%d/%.2d", date1.month, date1.day, date1.year, date2.month, date2.day, date2.year);
	else if (date2.year < date1.year)
		printf("%d/%d/%.2d is earlier than %d/%d/%.2d", date2.month, date2.day, date2.year, date1.month, date1.day, date1.year);
	else
		if (date1.month < date2.month)
			printf("%d/%d/%.2d is earlier than %d/%d/%.2d", date1.month, date1.day, date1.year, date2.month, date2.day, date2.year);
		else if (date2.month < date1.month)
			printf("%d/%d/%.2d is earlier than %d/%d/%.2d", date2.month, date2.day, date2.year, date1.month, date1.day, date1.year);
		else
			if (date1.day < date2.day)
				printf("%d/%d/%.2d is earlier than %d/%d/%.2d", date1.month, date1.day, date1.year, date2.month, date2.day, date2.year);
			else if (date2.day < date1.day)
				printf("%d/%d/%.2d is earlier than %d/%d/%.2d", date2.month, date2.day, date2.year, date1.month, date1.day, date1.year);
			else
				printf("Entered same date");
}