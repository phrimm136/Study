#include <stdio.h>

void split_time(int total_sec, int *hr, int *min, int *sec);

int main(void)
{
	int total_sec, hr, min, sec;
	
	printf("Enter total second: ");
	scanf("%d", &total_sec);
	
	split_time(total_sec, &hr, &min, &sec);
	
	printf("The time(hh:mm:ss) is %d:%.2d:%.2d", hr, min, sec);
	
	return 0;
}

void split_time(int total_sec, int *hr, int *min, int *sec)
{
	*hr = total_sec / 3600;
	total_sec %= 3600;
	*min = total_sec / 60;
	total_sec %= 60;
	*sec = total_sec;
}