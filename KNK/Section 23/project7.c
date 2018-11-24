#include <stdio.h>
#include <ctype.h>

int main(void)
{	
	char ch;
	int line_len = 0, end_flag = 0;
	
	while ((ch = getchar()) != EOF)
		if (ch == '.' || ch == ',' || ch == '?' || ch == '!')
			end_flag = 1;
		else if (end_flag == 1 && ch == '\n')
			line_len++;
			
	printf("%d", line_len);
	
	return 0;
}