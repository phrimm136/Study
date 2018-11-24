#include <stdio.h>

int main()
{
	int number;
	char *number_from_10_to_19[10] = {"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
									  "sixteen", "seventeen", "eighteen", "nineteen"};
	char *number_ten_digit[8] = {"twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
	char *number_one_digit[9] = {"-one", "-two", "-three", "-four", "-five", "-six", "-seven",
								  "-eight", "-nine"};
	
	printf("Enter a two-digit number: ");
	scanf("%d", &number);
	
	printf("You entered the number ");
	if (number >= 10 && number <= 19)
		printf("%s.\n", number_from_10_to_19[number % 10]);
	else
		printf("%s%s.\n", number_ten_digit[number / 10 - 2], number_one_digit[number % 10 - 1]);

	return 0;
}