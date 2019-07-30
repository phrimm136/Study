#include <stdio.h>
#include <string.h>

int main(void)
{	
	char *str = "A Garden Diary A Garden Diary A Garden Diary";
	char *p = strchr(str, 'd');
	char *q = strrchr(str, 'd');
	
	while (p != NULL)
	{
		printf("%s\n", p);
		p = strchr(p+1, 'd');
	}
	
	printf("\n");

	printf("%s\n", q);
	q = strchr(q-1, 'd');
	printf("%s\n", q); // strrchr can't locate all occurrences of a character within a string;
					   // infinite loop of the last occurrence
	
	return 0;
}