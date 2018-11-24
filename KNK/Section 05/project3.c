#include <stdio.h>

int main()
{
	int shares, price_per_share;
	double your_commission, rivals_commission;
	
	printf("Enter the number of shares: ");
	scanf("%d", &shares);
	printf("Enter the price per share(cent): ");
	scanf("%d", &price_per_share);
	
	your_commission = 0.01 * price_per_share * shares;
	rivals_commission = shares < 2000 ? 33 + 0.02 * shares : 33 + 0.03 * shares;
	
	printf("Your commission: $%.2f\n", your_commission);
	printf("Rivals commission: $%.2f\n", rivals_commission);
	
	return 0;
}