#include <stdio.h>

int main()
{
	char *month[12] = {"January", "February", "March", "April", "May", "June", "July", "August",
					   "September", "October", "November", "December"};
	int dd, mm, yyyy;
	
	printf("Enter a date (mm/dd/yyyy): ");
	scanf("%d/%d/%d", &mm, &dd, &yyyy);
	
	printf("You entered the date %s %2d, %4d", month[mm-1], dd, yyyy);
	
	return 0;
}