#include <stdio.h>
#include <time.h>

int main(void)
{
	time_t time_now;
	struct tm *t;
	char date_time[30];
	
	time(&time_now);
	t = localtime(&time_now);
	
	strftime(date_time, sizeof(date_time), "%Y-%j", t);
	puts(date_time);
	
	strftime(date_time, sizeof(date_time), "%Y-%V-%u", t);
	puts(date_time);
	
	strftime(date_time, sizeof(date_time), "%F %T", t);
	puts(date_time);
	
	return 0;
}