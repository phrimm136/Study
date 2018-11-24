#include <stdio.h>

int main(void)
{
	unsigned short i;
	
	i = 16;
	
	i ^= 0x0010;
	printf("%d ",i); 
	
	i ^= 0x0010;
	printf("%d ",i); 
	
	return 0;
}