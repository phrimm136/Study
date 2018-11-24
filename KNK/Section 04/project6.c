#include <stdio.h>

int main()
{
	int first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth, eleventh, twelfth,
		first_sum, second_sum, total, chk;
	
	printf("Enter the first 12 digits of a EAN: ");
	scanf("%1d", &first);
	scanf("%1d%1d%1d%1d%1d", &second, &third, &fourth, &fifth, &sixth);
	scanf("%1d%1d%1d%1d%1d%1d", &seventh, &eighth, &ninth, &tenth, &eleventh, &twelfth);
	
	first_sum = second + fourth + sixth + eighth + tenth + twelfth;
	second_sum = first + third + fifth + seventh + ninth + eleventh;
	total = 3 * first_sum + second_sum;
	chk = 9 - ((total - 1) % 10);
	printf("Check digit: %d", chk);
	
	return 0;
}