#include <stdio.h>
#include <stdbool.h>

int main()
{
	int digit_seen[10] = {0}, flag = 0, digit, n;
	
	printf("Enter a number: ");
	scanf("%d", &n);
	
	for(; n > 0; n /= 10)
	{
		digit = n % 10;
		if (digit_seen[digit])
			flag = 1;
		digit_seen[digit]++;
	}
	
	if (flag == true)
	{
		printf("Repeated digit(s): ");
		for (int i = 0; i < 10; i++)
		{
			if (digit_seen[i] > 1)
				printf("%d ", i);
		}
	}
	else
		printf("No repeated digit\n");
	
	return 0;
}