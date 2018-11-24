#include <stdio.h>

void encrypt(char *message, int shift);

int main()
{
	char sentence[80];
	int shift_amount;
	
	printf("Enter message to be encrypted: ");
	gets(sentence);
	printf("Enter shift amount (1-25): ");
	scanf("%d", &shift_amount);
	
	encrypt(sentence, shift_amount);
	
	printf("Encrypted message: %s", sentence);
		
	return 0;
}

void encrypt(char *message, int shift)
{
	for (char *p = message; *p; p++)
	{
		if (*p >= 'a' && *p <= 'z')
		{
			*p = ((*p - 'a') + shift) % 26 + 'a';
		}
		if (*p >= 'A' && *p <= 'Z')
		{
			*p = ((*p - 'A') + shift) % 26 + 'A';
		}
	}
}