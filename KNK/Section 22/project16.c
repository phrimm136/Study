#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	FILE *source_fp, *dest_fp;
	int number;
	char block[512];
	
	if (argc != 3)
	{
		fprintf(stderr, "usage: fcopy source destination\n");
		exit(EXIT_FAILURE);
	}
	
	if ((source_fp = fopen(argv[1], "rb")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", argv[1]);
		exit(EXIT_FAILURE);
	}
	
	if ((dest_fp = fopen(argv[2], "wb")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", argv[2]);
		fclose(source_fp);
		exit(EXIT_FAILURE);
	}
	
	for (;;)
	{
		number = fread(block, sizeof(char), sizeof(block) / sizeof(block[0]), source_fp);
		if (number == 0)
			break;
		fwrite(block, sizeof(char), number, dest_fp);
	}
	
	fclose(source_fp);
	fclose(dest_fp);
	return 0;
}