#include <stdio.h>

struct date {int month, day, year;};

int date(struct date d);

int main(void)
{
	struct date d = {2, 3, 2012};

	printf("The date of %2d/%2d/%2d(mm/dd/yyyy) is %d", d.month, d.day, d.year, date(d));

	return 0;
}

int date(struct date d)
{
	int day_of_month[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	int date = 0;
	
	if ((d.year % 4 == 0 && d.year % 100 != 0) || (d.year % 400 == 0))
		day_of_month[1]++;
	
	for (int month = 1; month < d.month; month++)
		date += day_of_month[month-1];
	date += d.day;
	
	return date;
}