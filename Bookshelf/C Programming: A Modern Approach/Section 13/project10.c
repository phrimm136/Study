#include <stdio.h>
#include <string.h>
#include <ctype.h>

void reverse_name(char *name);

int main()
{
	char name[20], str[10];
	
	printf("Enter a first and last name: ");
	scanf("%s", str);
	strcpy(name, str);
	strcat(name, " ");
	scanf("%s", str);
	strcat(name, str);
	reverse_name(name);
	
	printf("%s", name);
	
	return 0;
}

void reverse_name(char *name)
{
	char initial[2] = {*name};
	char lastname[10];
	
	for (int i = 0; name[i]; i++)
		if (name[i] == ' ')
			strcpy(lastname, &name[i+1]);
		
	strcpy(name, lastname);
	strcat(name, ", ");
	strcat(name, initial);
	strcat(name, ".");
}