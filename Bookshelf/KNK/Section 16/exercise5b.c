#include <stdio.h>

struct date {int month, day, year;};

int compare_dates(struct date d1, struct date d2);

int main(void)
{
	struct date d1 = {2, 3, 2012}, d2 = {3, 1, 2013};
	int compared;
	
	compared = compare_dates(d1, d2);
	
	if (compared == 1)
		printf("d1 is later than d2");
	else if (compared == -1)
		printf("d1 is earlier than d2");
	else
		printf("d1 and d2 is same");

	return 0;
}

int compare_dates(struct date d1, struct date d2)
{
	const int day_of_month[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	int date1 = 0, date2 = 0;
	
	if (((d1.year % 4 == 0 && d1.year % 100 != 0) || d1.year % 400 == 0) && d1.month > 2)
		date1++;
	if (((d2.year % 4 == 0 && d2.year % 100 != 0) || d2.year % 400 == 0) && d2.month > 2)
		date2++;
	
	if (d1.year > d2.year)
		return 1;
	else if (d1.year < d2.year)
		return -1;
	else
	{
		for (int month = 1; month < d1.month; month++)
			date1 += day_of_month[month-1];
		for (int month = 1; month < d2.month; month++)
			date2 += day_of_month[month-1];
		date1 += d1.day;
		date2 += d2.day;
		
		if (date1 > date2)
			return 1;
		else if (date1 < date2)
			return -1;
		else
			return 0;
	}
}