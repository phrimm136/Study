#include <stdio.h>

int main()
{
	char sentence[80] = {'\0'},  ch = '\0';
	int shift_amount, length;
	
	printf("Enter message to be encrypted: ");
	for(length = 0; ; length++)
	{
		ch = getchar();
		if (ch == '\n')
			break;
		sentence[length] = ch;
	}
	printf("Enter shift amount (1-25): ");
	scanf("%d", &shift_amount);
	
	printf("Encrypted message: ");
	for (int i = 0; i < length; i++)
	{
		
		if (sentence[i] >= 'a' && sentence[i] <= 'z')
		{
			sentence[i] = ((sentence[i] - 'a') + shift_amount) % 26 + 'a';
		}
		if (sentence[i] >= 'A' && sentence[i] <= 'Z')
		{
			sentence[i] = ((sentence[i] - 'A') + shift_amount) % 26 + 'A';
		}
		
		printf("%c", sentence[i]);
	}
	
	return 0;
}