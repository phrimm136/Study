#include <stdio.h>

#define STR_HELPER(x) #x
#define STR(x) STR_HELPER(x)
#define LINE_FILE "Line "STR(__LINE__)" of file "__FILE__

int main(void)
{	
	const char *str = LINE_FILE;
	
	printf("%s", str);
	
	return 0;
}