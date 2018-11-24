#include <stdio.h>
#include <time.h>

time_t first_of_year(int year);

int main(void)
{
	time_t first_time;
	int year;
	
	printf("Enter a year: ");
	scanf("%4d", &year);
	
	first_time = first_of_year(year);
	
	printf("%d", first_time);
	
	return 0;
}

time_t first_of_year(int year)
{
	struct tm t = {.tm_mday = 1};

	t.tm_year = year - 1900;
	
	return mktime(&t);
}