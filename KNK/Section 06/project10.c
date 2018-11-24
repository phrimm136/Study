#include <stdio.h>

int main()
{
	int year, month, day, year_earliest = 100, month_earliest = 13, day_earliest = 32;
	
	for(;;)
	{
		printf("Enter a date (mm/dd/yy): ");
		scanf("%d/%d/%d", &month, &day, &year);
		
		if (year == 0 && month == 0 && day == 0)
			break;
				
		if (year < year_earliest)
			year_earliest = year, month_earliest = month, day_earliest = day;
		else if (year_earliest < year);
		else
			if (month < month_earliest)
				year_earliest = year, month_earliest = month, day_earliest = day;
			else if (month_earliest < month);
			else
				if (day < day_earliest)
					year_earliest = year, month_earliest = month, day_earliest = day;
	}
	printf("%d/%d/%.2d is the earliest date", month_earliest, day_earliest, year_earliest);
	
	return 0;
}