#include <stdio.h>

int main(void)
{
	char *str = "#123,456,789", sales_rank[20];
	
	sscanf(str, str[0] == '#' ? "%*[#]%s" : "%*[^#]%*[#]%s", sales_rank);
	
	printf("%s", sales_rank);
	
	return 0;
}