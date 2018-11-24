#include <stdio.h>
#include <string.h>

void make_room(char *str);
void delete_first(char *str);
void copy_characters(char *str, char *char_array);
void copy_contents(char *arr1, char *arr2);

int main(void)
{	
	char str[14] = "hello, world!";
	
	make_room(str);
	for (int i = 0; i < 14; i++)
		printf("%c", str[i]);
	printf("\n");
	
	strcpy(str, "hello, world!");
	delete_first(str);
	for (int i = 0; i < 14; i++)
		printf("%c", str[i]);
	printf("\n");
	
	strcpy(str, "hello, world!");
	char ch[7] = {'\0'};
	copy_characters(str, ch);
	printf("%s", ch);
	printf("\n");
	
	strcpy(str, "hello, world!");
	char str_[14] = {'\0'};
	copy_contents(str_, str);
	printf("%s", str_);
	printf("\n");
	
	return 0;
}

void make_room(char *str)
{
	memmove(str+1, str, strlen(str));
	memcpy(str, "\0", 1);
}

void delete_first(char *str)
{
	memmove(str, str+1, strlen(str-1));
	memcpy(str + strlen(str) + 1, "\0", 1); 
}

void copy_characters(char *str, char *char_array)
{
	strncpy(char_array, str, 6);
}

void copy_contents(char *arr1, char *arr2)
{
	memcpy(arr1, arr2, strlen(arr2));
}