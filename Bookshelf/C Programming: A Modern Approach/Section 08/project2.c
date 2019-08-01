#include <stdio.h>

int main()
{
	int digit_seen[10] = {0}, digit, n;
	
	printf("Enter a number: ");
	scanf("%d", &n);
	
	for(; n > 0; n /= 10)
	{
		digit = n % 10;
		digit_seen[digit]++;
	}
	
	printf("Digit:\t    ");
	for (int i = 0; i < 10; i++)
		printf("%3d", i);
	printf("\n");
	printf("Occurrences:");
	for (int i = 0; i < 10; i++)
		printf("%3d", digit_seen[i]);
	
	return 0;
}