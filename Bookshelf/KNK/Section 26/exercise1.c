#include <stdio.h>
#include <stdarg.h>

int max_int(int n, ...);

int main(void)
{
	printf("%d", max_int(3, 10, 20, 30, 0));
	
	return 0;
}

int max_int(int n, ...)
{
	va_list ap;
	int current, largest;
	
	va_start(ap, n);
	largest = n;
	
	for (;;)
	{
		current = va_arg(ap, int);
		if (current == 0)
			break;
		if (current > largest)
			largest = current;
	}
	
	va_end(ap);
	return largest;
}