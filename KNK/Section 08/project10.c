#include <stdio.h>

int main()
{
	int hour, minute, flag = 0, i,
		departure_time[8][2] = {{8, 0}, {9, 43}, {11, 19}, {12, 47}, {14, 0}, {15, 45}, {19, 0}, {21, 45}},
		arrival_time[8][2] = {{10, 16}, {11, 52}, {13, 31}, {15, 0}, {16, 8}, {17, 55}, {21, 20}, {23, 58}},
		size = (int) (sizeof departure_time / sizeof departure_time[0]);
	
	printf("Enter a 24-hour time: ");
	scanf("%d:%d", &hour, &minute);
	
	for (i = 0; i < size - 1; i++)
	{
		if (hour * 60 + minute < (departure_time[i][0] * 60 + departure_time[i][1] + departure_time[i + 1][0] * 60 + departure_time[i + 1][1]) / 2.0)
		{
			if (departure_time[i][0] < 12)
				printf("Closest departure time is %d:%02d a.m., ", departure_time[i][0], departure_time[i][1]);
			else if (departure_time[i][0] == 12)
				printf("Closest departure time is %d:%02d p.m., ", departure_time[i][0], departure_time[i][1]);
			else if (departure_time[i][0] == 24)
				printf("Closest departure time is %d:%02d a.m., ", departure_time[i][0] % 12, departure_time[i][1]);
			else
				printf("Closest departure time is %d:%02d p.m., ", departure_time[i][0] % 12, departure_time[i][1]);
			if (arrival_time[i][0] < 12)
				printf("arriving at %d:%02d a.m.", arrival_time[i][0], arrival_time[i][1]);
			else if (arrival_time[i][0] == 12)
				printf("arriving at %d:%02d p.m.", arrival_time[i][0], arrival_time[i][1]);
			else if (arrival_time[i][0] == 24)
				printf("arriving at %d:%02d a.m.", arrival_time[i][0] % 12, arrival_time[i][1]);
			else
				printf("arriving at %d:%02d p.m.", arrival_time[i][0] % 12, arrival_time[i][1]);
			flag = 1;
			break;
		}
	}
	if (flag == 0)
	{
		if (departure_time[i][0] < 12)
				printf("Closest departure time is %d:%02d a.m., ", departure_time[i][0], departure_time[i][1]);
		else if (departure_time[i][0] == 12)
			printf("Closest departure time is %d:%02d p.m., ", departure_time[i][0], departure_time[i][1]);
		else if (departure_time[i][0] == 24)
			printf("Closest departure time is %d:%02d a.m., ", departure_time[i][0] % 12, departure_time[i][1]);
		else
			printf("Closest departure time is %d:%02d p.m., ", departure_time[i][0] % 12, departure_time[i][1]);
		if (arrival_time[i][0] < 12)
			printf("arriving at %d:%02d a.m.", arrival_time[i][0], arrival_time[i][1]);
		else if (arrival_time[i][0] == 12)
			printf("arriving at %d:%02d p.m.", arrival_time[i][0], arrival_time[i][1]);
		else if (arrival_time[i][0] == 24)
			printf("arriving at %d:%02d a.m.", arrival_time[i][0] % 12, arrival_time[i][1]);
		else
			printf("arriving at %d:%02d p.m.", arrival_time[i][0] % 12, arrival_time[i][1]);
	}
	
	return 0;
}