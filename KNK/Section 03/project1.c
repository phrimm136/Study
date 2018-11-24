#include <stdio.h>

int main()
{
	int year, month, day;
	
	printf("Enter a date (mm/dd/yyyy): ");
	scanf("%d/%d/%d", &month, &day, &year);
	
	printf("You entered the date %04d%02d%02d", year, month, day);
	
	return 0;
}