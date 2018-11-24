#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main(void)
{
	FILE *fp;
	char file_name[30], buffer[10];
	int offset = 0;
	
	printf("Enter a file name to display: ");
	scanf("%s", file_name);
		
	if ((fp = fopen(file_name, "rb")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", file_name);
		exit(EXIT_FAILURE);
	}
	
	printf("Offset              Bytes              Characters\n"
		   "------  -----------------------------  ----------\n");
	for (;; offset += 10)
	{
		int i = 0, n;
		
		n = fread(buffer, 1, 10, fp);
		if (n == 0)
			break;
		
		printf("%6d  ", offset);
		
		for (; i < n; i++)
			printf("%02X ", buffer[i]);
		for (; i < 10; i++)
			printf("   ");
		
		printf(" ");
		for (i = 0; i < n; i++)
		{
			if (isprint(buffer[i]))
				printf("%c", buffer[i]);
			else
				printf(".");
		}
		putchar('\n');
	}
	fclose(fp);
	
	return 0;
}