#include <stdio.h>

struct flight_time {int departure, arrival;};

int main()
{
	struct flight_time time[] = {{480, 616}, {583, 712}, {679, 811}, {767, 900}, {840, 968}, {945, 1075},
								 {1140, 1280}, {1305, 1438}};
	int minute, size = sizeof(time)/ sizeof(time[0]);

	printf("Enter a minute time: ");
	scanf("%d", &minute);
	
	for (int i = 1; i < size; i++)
		if (minute < (time[i-1].departure + time[i].departure) / 2.0)
		{
			printf("Closest departure time is %d, arriving at %d", time[i-1].departure, time[i-1].arrival);
			return 0;
		}
	printf("Closest departure time is %d, arriving at %d", time[size-1].departure, time[size-1].arrival);
	
	return 0;
}