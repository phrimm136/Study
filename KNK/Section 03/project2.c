#include <stdio.h>

int main()
{
	int number, year, month, day;
	double price;
	
	printf("Enter item number: ");
	scanf("%d", &number);
	printf("Enter unit price: ");
	scanf("%lf", &price);
	printf("Enter a date (mm/dd/yyyy): ");
	scanf("%d/%d/%d", &month, &day, &year);
	
	printf("Item\t\tUnit\t\tPurchase\n");
	printf("\t\tPrice\t\tDate\n");
	printf("%-d\t\t$%7.2f\t%02d/%02d/%04d", number, price, month, day, year);
	
	return 0;
}