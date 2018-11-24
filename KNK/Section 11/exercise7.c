#include <stdio.h>

int days_of_month[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

void split_date(int day_of_year, int year, int *month, int *day);

int main(void)
{
	int day_of_year, year, month, day;
	
	printf("Enter days of year(1 - 366) and year: ");
	scanf("%d %d", &day_of_year, &year);
	
	split_date(day_of_year, year, &month, &day);
	
	printf("The date(mm/dd/yyyy) is %d/%d/%d", month, day, year);
	
	return 0;
}

void split_date(int day_of_year, int year, int *month, int *day)
{
	if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
		days_of_month[1]++;
	
	for (*month = 1; day_of_year > days_of_month[(*month) - 1]; (*month)++)
		day_of_year -= days_of_month[*month];
	*day = day_of_year;
}