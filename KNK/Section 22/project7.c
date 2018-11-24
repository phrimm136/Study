#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

void compress_file(FILE *fp_in, char file_name[]);
void uncompress_file(FILE *fp_in, char file_name[]);

int main(int argc, char *argv[])
{
	FILE *fp_in;
	char file_name[100], mode;
	
	if ((fp_in = fopen(argv[1], "rb")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", argv[1]);
		exit(EXIT_FAILURE);
	}
	strcpy(file_name, argv[1]);
	
	printf("Choose mode : e(encode), d(decode) ");
	scanf("%c", &mode);
	if (mode == 'e')
		compress_file(fp_in, file_name);
	else if (mode == 'd')
		uncompress_file(fp_in, file_name);
	else
		printf("Invalid input");
	
	fclose(fp_in);
	
	return 0;
}

void compress_file(FILE *fp_in, char file_name[])
{
	FILE *fp_out;
	int number = 0, ch = 0, read;
	char file_name_out[30] = {'\0'};

	strcpy(file_name_out, file_name);
	strcat(file_name_out, ".rle");
	if ((fp_out = fopen(file_name_out, "wb")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", file_name_out);
		exit(EXIT_FAILURE);
	}
	
	while (1)
	{
		read = fgetc(fp_in);
		if (read == EOF)
		{
			fputc(number, fp_out);
			fputc(ch, fp_out);
			number = 0;
			break;
		}
		if (number == 0)
		{
			number++;
			ch = read;
		}
		else if (ch == read)
			number++;
		else
		{
			fputc(number, fp_out);
			fputc(ch, fp_out);
			number = 1;
			ch = read;
		}
	}
	
	fclose(fp_out);
}

void uncompress_file(FILE *fp_in, char file_name[])
{
	FILE *fp_out;
	int count, ch;
	char file_name_out[30] = {'\0'}, *extension = strstr(file_name, ".rle");
	
	while (extension != NULL)
	{
		if (strcmp(extension, ".rle") == 0)
			strncpy(file_name_out, file_name, strlen(file_name)-4);
		extension = strstr(extension+1, ".rle");
	}
	
	if (*file_name_out == '\0')
	{
		fprintf(stderr, "Error: file doesn't end with the .rle extension.\n");
		exit(EXIT_FAILURE);
	}
	
	if ((fp_out = fopen(file_name_out, "wb+")) == NULL)
	{
		fprintf(stderr, "Can't make %s\n", file_name_out);
		exit(EXIT_FAILURE);
	}
	
	while (1)
	{
		count = fgetc(fp_in);
		if (count == EOF)
			break;
		ch = fgetc(fp_in);
		for (int i = 1; i <= count; i++)
			fputc(ch, fp_out);
	}
	
	fclose(fp_out);
}