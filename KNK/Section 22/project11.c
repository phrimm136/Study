#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	char str[30];
	int month, day, year;
	char *month_name[12] = {"January", "February", "March", "April", "May", "June", "July", "August",
							"September", "October", "November", "December"};
	
	printf("Enter a date in specific form(mm-dd-yyyy of mm/dd/yyyy): ");
	scanf("%s", str);
	
	if (sscanf(str, "%d/%d/%d", &month, &day, &year) == 3)
		printf("%s %2d, %04d", month_name[month-1], day, year);
	else if (sscanf(str, "%d-%d-%d", &month, &day, &year) == 3)
		printf("%s %2d, %04d", month_name[month-1], day, year);
	else
		printf("Date not in the proper form\n");
	
	return 0;
}