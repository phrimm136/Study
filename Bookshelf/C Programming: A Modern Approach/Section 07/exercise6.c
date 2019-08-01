#include <stdio.h>

int main()
{
	short days_in_a_month = 31, days_in_a_year = 365, minutes_in_a_day = 1440, seconds_in_a_day = 86400;
	/* minimum capacit is int*/
	
	printf("%hd %hd %hd %hd", days_in_a_month, days_in_a_year, minutes_in_a_day, seconds_in_a_day);
	
	return 0;
}