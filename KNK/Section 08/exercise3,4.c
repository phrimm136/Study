#include <stdio.h>
#include <stdbool.h>

int main()
{
	bool weekend[7] = {true, [6] = true};
	
	for (int i = 0; i < 7; i++)
		weekend[i] == true ? printf("true\n") : printf("false\n");
	
	return 0;
}