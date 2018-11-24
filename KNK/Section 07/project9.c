#include <stdio.h>
#include <ctype.h>

int main()
{
	int hour, minute;
	char indicator = '\0';
	
	printf("Enter a 12-hour time: ");
	scanf("%d:%d ", &hour, &minute);
	while (1)
	{
        indicator = getchar();
        if (toupper(indicator) == 'A' || toupper(indicator) == 'P')
			break;
	}

	if (toupper(indicator) == 'P')
		hour += 12;
	
	printf("Equivalent 24-hour time: %d:%d", hour, minute);
	
	return 0;
}