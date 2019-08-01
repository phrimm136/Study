#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>

bool test_extension(const char *file_name, const char *extension);

int main(void)
{
	char *file = "pun.txt", extension[4] = "TXT";
	
	test_extension(file, extension) ? printf("true") : printf("false");
	
	return 0;
}

bool test_extension(const char *file_name, const char *extension)
{
	char p[4], q[4];
		
	for (int i = 0; file_name[i]; i++)
		if (file_name[i] == '.')
			strcpy(p, &file_name[i+1]);	
	for (int i = 0; p[i]; i++)
		p[i] = toupper(p[i]);
	for (int i = 0; extension[i]; i++)
		q[i] = toupper(extension[i]);
		
	if (strcmp(p, q) == 0)
		return true;
	else
		return false;
}