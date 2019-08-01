#include <stdio.h>

void find_closest_flight(int desired_time, int *departure_time, int *arrival_time);

int main()
{
	int desired_time, departure_time, arrival_time;
	
	printf("Enter a minutes(1-1440): ");
	scanf("%d", &desired_time);
	
	find_closest_flight(desired_time, &departure_time, &arrival_time);
	
	printf("Closest departure time is %d, arrving at %d. ", departure_time, arrival_time);
	
	return 0;
}

void find_closest_flight(int desired_time, int *departure_time, int *arrival_time)
{
	if (desired_time < ((8 * 60) + (9 * 60 + 43)) / 2.0)
	{
		*departure_time = 480;
		*arrival_time = 616;
	}
	else if (desired_time < ((9 * 60 + 43) + (11 * 60 + 19)) / 2.0)
	{
		*departure_time = 583;
		*arrival_time = 712;
	}
	else if (desired_time < ((11 * 60 + 19) + (12 * 60 + 47)) / 2.0)
	{
		*departure_time = 679;
		*arrival_time = 811;
	}
	else if (desired_time < ((12 * 60 + 47) + (14 * 60)) / 2.0)
	{
		*departure_time = 767;
		*arrival_time = 900;
	}
	else if (desired_time < ((14 * 60) + (15 * 60 + 45)) / 2.0)
	{
		*departure_time = 840;
		*arrival_time = 968;
	}
	else if (desired_time < ((15 * 60 + 45) + (19 * 60)) / 2.0)
	{
		*departure_time = 945;
		*arrival_time = 1075;
	}
	else if (desired_time < ((19 * 60) + (21 * 60 + 45)) / 2.0)
	{
		*departure_time = 1140;
		*arrival_time = 1280;
	}
	else
	{
		*departure_time = 1305;
		*arrival_time = 1438;
	}
}