#include <stdio.h>

int main()
{
	int days, starting, day_count = 0;
	
	printf("Enter number of days in month: ");
	scanf("%d", &days);
	printf("Enter starting day of the week (1=Sun, 7=Sat): ");
	scanf("%d", &starting);
	
	
	for (int i = 1; i < starting; i++)
	{
		printf("   ");
		day_count++;
	}
	for (int i = 1; i <= days; i++)
	{
		printf("%2d ", i);
		day_count++;
		if (day_count % 7 == 0)
			printf("\n");
	}
	
	return 0;
}