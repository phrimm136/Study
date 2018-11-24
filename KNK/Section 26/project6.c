#include <stdio.h>
#include <time.h>
#include <string.h>

int main(void)
{
	struct tm *t = {0};
	time_t initial_time;
	char date_time[40];

	time(&initial_time);
	t = localtime(&initial_time);
	
	strftime(date_time, sizeof(date_time) / sizeof(date_time[0]), "%A, %B %d, %Y  %I:%M", t);
	if (t->tm_hour < 12)
		strcat(date_time, "a");
	else
		strcat(date_time, "p");
	printf("%s\n", date_time);
	
	strftime(date_time, sizeof(date_time) / sizeof(date_time[0]), "%a, %d %b %y  %R", t);
	printf("%s\n", date_time);
	
	strftime(date_time, sizeof(date_time) / sizeof(date_time[0]), "%x %r", t);
	printf("%s\n", date_time);

	return 0;
}