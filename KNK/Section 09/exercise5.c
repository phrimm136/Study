#include <stdio.h>

int num_digits(int n);

int main()
{
	int number;
	
	printf("Enter a number: ");
	scanf("%d", &number);
	
	printf("The number of digits in %d is %d", number, num_digits(number));
	
	return 0;
}

int num_digits(int n)
{
	int num_of_digits = 0;
	
	for (; n != 0; n /= 10, num_of_digits++);
	
	return num_of_digits;
}