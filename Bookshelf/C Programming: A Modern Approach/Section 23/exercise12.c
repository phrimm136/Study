#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

char *my_strdup(char *s);
int my_stricmp(char *s1, char *s2);
char *my_strlwr(char *s);
char *my_strrev(char *s);
char *my_strset(char *s, char ch);

int main(void)
{	
	char s1[50] = "pen pineapple apple pen";
	char s2[50] = "Pen Pineapple Apple Pen";
	char *s_copy;
	
	s_copy = my_strdup(s1);
	printf("%s\n", s_copy);
	
	printf("%d\n", my_stricmp(s1, s2));
	
	printf("%s\n", my_strlwr(s2));
	
	printf("%s\n", my_strrev(s2));
	
	printf("%s\n", my_strset(s2, 'p'));
	
	return 0;
}

char *my_strdup(char *s)
{
	char *str = malloc(strlen(s) + 1);
	if (str == NULL)
		return NULL;
	
	strcpy(str, s);
	
	return str;
}

int my_stricmp(char *s1, char *s2)
{
	for (; tolower(*s1) == tolower(*s2) && (*s1 != '\0' || *s2 != '\0'); s1++, s2++)
		;
	return *s1 - *s2;
}

char *my_strlwr(char *s)
{
	for (char *p = s; *p != '\0'; p++)
		if (isupper(*p))
			*p = tolower(*p);
	
	return s;
}

char *my_strrev(char *s)
{
	int i, middle = (int) (strlen(s) / 2.0 + 0.5), len = strlen(s);
	char tmp;
	
	for (i = 0; i < middle; i++)
	{
		tmp = s[i];
		s[i] = s[len-i-1];
		s[len-i-1] = tmp;
	}
	
	return s;
}

char *my_strset(char *s, char ch)
{
	for (char *p = s; *p != '\0'; p++)
		*p = ch;
		
	return s;
}