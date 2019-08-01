#include <stdio.h>

int main(void)
{
	int widget = 1;
	
	printf(widget == 1 ? "%d widget" : "%d widgets", widget);
	
	return 0;
}