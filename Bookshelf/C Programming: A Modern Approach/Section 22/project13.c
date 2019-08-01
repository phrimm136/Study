#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	FILE *fp;
	char time1[20], time2[20];
	int hour1, minute1, hour2, minute2, time, departure1, arrival1, departure2, arrival2;
	
	if ((fp = fopen("flights.dat", "rb")) == NULL)
	{
		fprintf(stderr, "Can't open file \"flights.dat\"");
		exit(EXIT_FAILURE);
	}
		
	printf("Enter a 24-hour time: ");
	scanf("%d:%d", &hour1, &minute1);
	time = hour1 * 60 + minute1;
	
	for (int ch, i = 0; (ch = fgetc(fp)) != '\n'; i++)
		time1[i] = (char) ch;
	sscanf(time1, "%2d:%2d %2d:%2d", &hour1, &minute1, &hour2, &minute2);
	departure1 = hour1 * 60 + minute1;
	arrival1 = hour2 * 60 + minute2;
	
	for (int ch, i = 0; (ch = fgetc(fp)) != '\n'; i++)
		time2[i] = (char) ch;
	sscanf(time2, "%2d:%2d %2d:%2d", &hour1, &minute1, &hour2, &minute2);
	departure2 = hour1 * 60 + minute1;
	arrival2 = hour2 * 60 + minute2;
	
	for (;;)
	{
		if (time < (departure1 + departure1) / 2)
		{
			printf("Closest departure time is %2d:%2d, arriving at %2d:%2d",
				   departure1 / 60, departure1 % 60, arrival1 / 60, arrival1 % 60);
			return 0;
		}
		else
		{
			departure1 = departure2;
			arrival1 = arrival2;
			for (int ch, i = 0; (ch = fgetc(fp)) != '\n'; i++)
			{
				if (ch == EOF)
				{
					printf("Closest departure time is %2d:%2d, arriving at %2d:%2d",
							departure1 / 60, departure1 % 60, arrival1 / 60, arrival1 % 60);
					return 0;
				}
				time2[i] = (char) ch;
			}
			sscanf(time2, "%2d:%2d %2d:%2d", &hour1, &minute1, &hour2, &minute2);
			departure2 = hour1 * 60 + minute1;
			arrival2 = hour2 * 60 + minute2;
		}
	}
}