#include <stdio.h>

int main()
{
	int year1, month1, day1, year2, month2, day2;
	
	printf("Enter first date (mm/dd/yy): ");
	scanf("%d/%d/%d", &month1, &day1, &year1);
	printf("Enter second date (mm/dd/yy): ");
	scanf("%d/%d/%d", &month2, &day2, &year2);
	
	if (year1 < year2)
		printf("%d/%d/%.2d is earlier than %d/%d/%.2d", month1, day1, year1, month2, day2, year2);
	else if (year2 < year1)
		printf("%d/%d/%.2d is earlier than %d/%d/%.2d", month2, day2, year2, month1, day1, year1);
	else
		if (month1 < month2)
			printf("%d/%d/%.2d is earlier than %d/%d/%.2d", month1, day1, year1, month2, day2, year2);
		else if (month2 < month1)
			printf("%d/%d/%.2d is earlier than %d/%d/%.2d", month2, day2, year2, month1, day1, year1);
		else
			if (day1 < day2)
				printf("%d/%d/%.2d is earlier than %d/%d/%.2d", month1, day1, year1, month2, day2, year2);
			else if (day2 < day1)
				printf("%d/%d/%.2d is earlier than %d/%d/%.2d", month2, day2, year2, month1, day1, year1);
			else
				printf("Entered same date");
	
	return 0;
}