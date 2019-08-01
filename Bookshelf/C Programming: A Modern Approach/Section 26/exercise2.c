#include <stdio.h>
#include <stdarg.h>

int int_printf(const char *str, ...);

int main(void)
{
	int_printf("%d - %d = %d", 1234, 5678, 1234 - 5678);
	
	return 0;
}

int int_printf(const char *str, ...)
{
	const char *p;
	int current, printf_success = 0, tmp, power;
	va_list ap;
	
	va_start(ap, str);
	
	for (p = str; *p != '\0'; p++)
	{
		if (*p == '%')
		{
			if (*++p == 'd')
			{
				power = 1;
				current = va_arg(ap, int);
				
				if (current < 0)
				{
					putchar('-');
					current = -current;
				}
				tmp = current;
				for(; tmp > 9; tmp /= 10)
					power *= 10;
				while (current != 0)
				{
					putchar((current / power) + '0');
					current %= power;
					power /= 10;
				}
				
				printf_success++;
			}
		}
		else
		{
			putchar(*p);
			printf_success++;
		}
	}
	
	va_end(ap);
	return printf_success;
}