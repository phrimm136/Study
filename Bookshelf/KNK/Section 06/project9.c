#include <stdio.h>

int main()
{
	double amount_of_loan, interest_rate, monthly_payment;
	int number_of_payment;
	
	printf("Enter amount of loan: ");
	scanf("%lf", &amount_of_loan);
	printf("Enter interest rate: ");
	scanf("%lf", &interest_rate);
	printf("Enter number of payment: ");
	scanf("%d", &number_of_payment);
	
	for (int i = 1; i <= number_of_payment; i++)
	{
		printf("Enter monthly payment: ");
		scanf("%lf", &monthly_payment);
		
		amount_of_loan = amount_of_loan * (1 + interest_rate / 100.0 / 12.0) - monthly_payment;
		printf("Balance remaining after payment: %.2f\n", amount_of_loan);
	}
	
	return 0;
}