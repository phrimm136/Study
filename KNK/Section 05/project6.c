#include <stdio.h>

int main()
{
	int first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth, eleventh,
		first_sum, second_sum, total, chk, upc;
	
	printf("Enter the first (single) digit: ");
	scanf("%1d", &first);
	printf("Enter first group of five digits: ");
	scanf("%1d%1d%1d%1d%1d", &second, &third, &fourth, &fifth, &sixth);
	printf("Enter second group of five digits: ");
	scanf("%1d%1d%1d%1d%1d", &seventh, &eighth, &ninth, &tenth, &eleventh);
	printf("Enter a UPC");
	scanf("%d", &upc);
	
	first_sum = first + third + fifth + seventh + ninth + eleventh;
	second_sum = second + fourth + sixth + eighth + tenth;
	total = 3 * first_sum + second_sum;
	chk = 9 - ((total - 1) % 10);
	
	if (chk == upc)
		printf("VALID\n");
	else
		printf("NOT VALID\n");
	
	return 0;
}