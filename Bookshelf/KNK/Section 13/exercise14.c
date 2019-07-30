#include <stdio.h>

int main(void)
{
	char s[] = "Hsjodi", *p;
	
	for (p = s; *p; p++)
		--*p;
	
	printf("%s", s);
	
	return 0;
}