#include <stdio.h>

int main()
{
	int digit_seen[10] = {0}, digit, n;
	
	printf("Enter some numbers (less than or equal to 0 to terminate): ");
	for(;;)
	{
		scanf("%d", &n);
		
		if (n <= 0)
			break;
	
		for(; n > 0; n /= 10)
		{
			digit = n % 10;
			digit_seen[digit]++;
		}
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