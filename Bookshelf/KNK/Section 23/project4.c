#include <stdio.h>
#include <string.h>

int main(void)
{	
	char str[100] = {' '}, *p = str, ch;
	int len, i = 1;
	
	printf("Enter a series of words: ");
	while ((ch = getchar()) != '\n')
		str[i++] = ch;
	len = strlen(str);
	
	p = strtok(p, " ");
	while (p != NULL)
		p = strtok(NULL, " ");
		
	
	for (p = str + (len - 1); p >= str; p--)
		if (*p == '\0' || p == str)
			printf("%s ", p+1);
	
	return 0;
}