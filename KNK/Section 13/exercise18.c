#include <stdio.h>

void remove_filename(char *url);

int main(void)
{
	char url[100] = "http://www.knking.com/index.html";
	
	remove_filename(url);
	
	printf("%s", url);
	
	return 0;
}

void remove_filename(char *url)
{
	int slash = 0;
	for (int i = 0; url[i]; i++)
	{
		if (url[i] == '/')
			slash++;
		if (slash == 3)
			url[i] = '\0';
	}
}