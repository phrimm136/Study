#include <stdio.h>

#define islower(c) ((c) >= 'a' && (c) <= 'z')

int main(void)
{
	char ch1 = 'A';
	int ch2 = 100;
	
	printf("%d %d", islower(ch1), islower(ch2));
	
	return 0;
}