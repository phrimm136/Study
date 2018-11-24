#include <stdio.h>
#include <stdarg.h>

void display(int n, ...);

int main(void)
{
	display(4, "Special", "Agent", "Dale", "Cooper");
	
	return 0;
}

void display(int n, ...)
{
	va_list ap;
	const char *current;
	
	va_start(ap, n);
	
	for (int i = 0; i < 4; i++)
	{
		current = va_arg(ap, const char *);
		fputs(current, stdout);
		putchar(' ');
	}
	
	va_end(ap);
}