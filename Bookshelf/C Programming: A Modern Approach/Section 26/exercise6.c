#include <stdio.h>
#include <stdarg.h>

char *max_pair(int num_parts, ...);

int main(void)
{
	puts(max_pair(5, 180, "Seinfeld", 180, "I Love Lucy", 39, "The Honeymooners", 210, "All in the Family",
				  86, "The Sopranos"));
	
	return 0;
}

char *max_pair(int num_parts, ...)
{
	va_list ap;
	char *current_str, *max_str;
	int max = 0, current_int;
	
	va_start(ap, num_parts);
	
	for (int i = 0; i < 5; i++)
	{
		current_int = va_arg(ap, int);
		current_str = va_arg(ap, char *);
		if (i == 0 || max < current_int)
		{
			max = current_int;
			max_str = current_str;
		}
	}
	
	va_end(ap);
	return max_str;
}