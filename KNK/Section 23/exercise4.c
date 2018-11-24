#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>

bool check_c_identifier(char *str);

int main(void)
{	
	printf("%d %d %d %d",
			check_c_identifier("##"), check_c_identifier("1st"),
			check_c_identifier("c_identifier"), check_c_identifier("func1"));
	
	return 0;
}

bool check_c_identifier(char *str)
{
	if ((isalpha(*str) || *str == '_') == 0)
		return false;
	for (char *p = str+1; *p != '\0'; p++)
		if ((isalnum(*p) || *p == '_') == 0)
			return false;
			
	return true;
}