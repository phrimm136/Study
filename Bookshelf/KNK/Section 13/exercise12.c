#include <stdio.h>
#include <string.h>

void get_extension(const char *file_name, char *extension);

int main(void)
{
	char *file = "pun.exe", extension[5];
	
	get_extension(file, extension);
	
	printf("%s", extension);
	
	return 0;
}

void get_extension(const char *file_name, char *extension)
{	
	for (int i = 0; i < (int) strlen(file_name); i++)
	{
		if (file_name[i] == '.')
		{
			strcpy(extension, &file_name[i+1]);
			return;
		}
	}
	*extension = '\0';
}