#include <stdio.h>

int main()
{
	int hour, minute;
	
	printf("Enter a 24-hour time: ");
	scanf("%d:%d", &hour, &minute);
	
	if (hour * 60 + minute < ((8 * 60) + (9 * 60 + 43)) / 2.0)
		printf("Closest departure time is 8:00 a.m., arriving at 10:16 a.m.");
	else if (hour * 60 + minute < ((9 * 60 + 43) + (11 * 60 + 19)) / 2.0)
		printf("Closest departure time is 9:43 a.m., arriving at 11:52 a.m.");
	else if (hour * 60 + minute < ((11 * 60 + 19) + (12 * 60 + 47)) / 2.0)
		printf("Closest departure time is 11:19 a.m., arriving at 1:31 p.m.");
	else if (hour * 60 + minute < ((12 * 60 + 47) + (14 * 60)) / 2.0)
		printf("Closest departure time is 12:47 p.m., arriving at 3:00 p.m.");
	else if (hour * 60 + minute < ((14 * 60) + (15 * 60 + 45)) / 2.0)
		printf("Closest departure time is 2:00 p.m., arriving at 4:08 p.m.");
	else if (hour * 60 + minute < ((15 * 60 + 45) + (19 * 60)) / 2.0)
		printf("Closest departure time is 3:45 p.m., arriving at 5:55 p.m.");
	else if (hour * 60 + minute < ((19 * 60) + (21 * 60 + 45)) / 2.0)
		printf("Closest departure time is 7:00 p.m., arriving at 9:20 p.m.");
	else
		printf("Closest departure time is 9:45 p.m., arriving at 11:58 p.m.");
	
	return 0;
}