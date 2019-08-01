#include <stdio.h>

int main()
{
	double amount_of_loan, interest_rate, monthly_payment;
	
	printf("Enter amount of loan: ");
	scanf("%lf", &amount_of_loan);
	printf("Enter interest rate: ");
	scanf("%lf", &interest_rate);
	printf("Enter monthly payment: ");
	scanf("%lf", &monthly_payment);
	
	amount_of_loan = amount_of_loan * (1 + interest_rate / 100.0 / 12.0) - monthly_payment;
	printf("Balance remaining after first payment: %.2f\n", amount_of_loan);
	amount_of_loan = amount_of_loan * (1 + interest_rate / 100.0 / 12.0) - monthly_payment;
	printf("Balance remaining after second payment: %.2f\n", amount_of_loan);
	amount_of_loan = amount_of_loan * (1 + interest_rate / 100.0 / 12.0) - monthly_payment;
	printf("Balance remaining after third payment: %.2f\n", amount_of_loan);
	
	return 0;
}