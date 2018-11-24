#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>

int check_hexadecimal(char *str);

int main(void)
{	
	printf("%d %d %d %d",
			check_hexadecimal("##"), check_hexadecimal("1st"),
			check_hexadecimal("c"), check_hexadecimal("C4"));
	
	return 0;
}

int check_hexadecimal(char *str)
{
	int hex_value = 0;
	
	for (char *p = str; *p != '\0'; p++)
	{
		if (isxdigit(*p))
		{
			if (isdigit(*p))
				hex_value += *p - '0';
			else if (islower(*p))
				hex_value += *p - 'a' + 10;
			else
				hex_value += *p - 'A' + 10;
		}
		else
			return -1;
	}
	
	return hex_value;
}