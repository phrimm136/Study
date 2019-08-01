#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

char *vstrcat(const char *first, ...);

int main(void)
{
	puts(vstrcat("Special", "Agent", "Dale", "Cooper", NULL));
	
	return 0;
}

char *vstrcat(const char *first, ...)
{
	va_list ap;
	const char *current;
	char *attatched, *tmp;
	int string_size = 0;
	
	va_start(ap, first);
	
	for (current = first; current != NULL; current = va_arg(ap, const char *))
		for (const char *p = current; *p != '\0'; p++)
			string_size++;
	if ((attatched = malloc(string_size * sizeof(char) + 1)) == NULL)
		return NULL;
	va_end(ap);
	
	va_start(ap, first);
	tmp = attatched;
	for (current = first; current != NULL; current = va_arg(ap, const char *))
		for (const char *p = current; *p != '\0'; p++)
		{
			*tmp = *p;
			tmp++;
		}
	*tmp = '\0';
	tmp++;
	
	va_end(ap);
	return attatched;
}