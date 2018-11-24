#include <stdio.h>
#include <locale.h>
#include <string.h>

int main(void)
{
	char *first_locale, *second_locale;
	first_locale = setlocale(LC_ALL, "");
	second_locale = setlocale(LC_ALL, "C");
	
	if (strcmp(first_locale, second_locale) == 0)
		printf("Native locale is the same as \"C\" locale.");
	else
		printf("Native locale is not the same as \"C\" locale.");
	
	return 0;
}