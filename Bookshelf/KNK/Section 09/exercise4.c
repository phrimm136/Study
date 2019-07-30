#include <stdio.h>

int day_of_year(int month, int day, int year);

int main()
{
	int month, day, year;
	
	printf("Enter a month, day, and year: ");
	scanf("%d %d %d", &month, &day, &year);
	
	printf("The day of the year is: %d", day_of_year(month, day, year));
	
	return 0;
}

int day_of_year(int month, int day, int year)
{
	int days_of_month[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}, days = 0;
	
	if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
		days_of_month[1] = 29;
	
	for (int i = 0; i < month - 1; i++)
		days += days_of_month[i];
	days += day;
	
	return days;
}