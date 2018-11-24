#include <stdio.h>
#include <string.h>

int main(void)
{
	char s1[100], s2[100];
	
	strcpy(s1, "computer");
	strcpy(s2, "science");
	if (strcmp(s1, s2) < 0)
		strcat(s1, s2);
	else
		strcat(s2, s1);
	s1[strlen(s1)-6] = '\0';
	
	printf("%s\n%s", s1, s2);
	
	return 0;
}
