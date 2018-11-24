#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main(int argc, char *argv[])
{
	FILE *source_fp, *dest_fp;
	int ch, EOF_flag = 0, first, second, third;
	char input[20], output[20];
	
	if (argc != 3)
	{
		fprintf(stderr, "usage: standard_format source destination\n");
		exit(EXIT_FAILURE);
	}
	
	if ((source_fp = fopen(argv[1], "r")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", argv[1]);
		exit(EXIT_FAILURE);
	}
	
	if ((dest_fp = fopen(argv[2], "w")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", argv[2]);
		fclose(source_fp);
		exit(EXIT_FAILURE);
	}
	
	for(;;)
	{
		for (int i = 0; (ch = fgetc(source_fp)) != '\n'; i++)
		{
			if (ch == EOF)
			{
				EOF_flag = 1;
				break;
			}
			input[i] = ch;
		}
		
		sscanf(input, isdigit(input[0]) ?  "%3d%*[^0-9]%3d%*[^0-9]%4d" :
										   "%*[^0-9]%3d%*[^0-9]%3d%*[^0-9]%4d", &first, &second, &third);
		sprintf(output, "(%d) %d-%d\n", first, second, third);
		fputs(output, dest_fp);
		
		if (EOF_flag == 1)
			break;
	}
	
	fclose(source_fp);
	fclose(dest_fp);
	return 0;
}