#include <stdio.h>

int main()
{
	int temperature_readings[30][24], sum_temperature = 0;
	double avg_temperature

	for (int i = 0; i < 30; i++)
		for (int j = 0; j < 24; j++)
			sum_temperature += temperature_readings[i][j];
	avg_temperature = sum_temperature / 30.0 / 24.0;
	
	return 0;
}