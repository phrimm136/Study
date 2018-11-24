#include <stdio.h>

struct time {int hours, minutes, seconds;};

struct time split_time(int total_seconds);

int main(void)
{
	int total_seconds = 34931;
	struct time time_splited;
	
	time_splited = split_time(total_seconds);
	
	printf("%d second(s) equal(s) %2d:%2d:%2d", total_seconds, time_splited.hours, time_splited.minutes, time_splited.seconds);

	return 0;
}

struct time split_time(int total_seconds)
{
	struct time split_time;
	
	split_time.hours = total_seconds / 3600;
	total_seconds %= 3600;
	split_time.minutes = total_seconds / 60;
	split_time.seconds = total_seconds % 60;
	
	return split_time;
}