#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	FILE *fp;
	int fail_flag = 0;
	
	if (argc < 2)
	{
		printf("usage: canopen filename filename ...\n");
		exit(EXIT_FAILURE);
	}
	
	for (int i = 1; i < argc; i++)
	{
		if ((fp = fopen(argv[i], "r")) == NULL)
		{
			printf("%s can't be opened\n", argv[i]);
			fail_flag = 1;
		}
		else
		{
			printf("%s can be opened\n", argv[i]);
			fclose(fp);
		}
	}
	
	if (fail_flag)
		exit(EXIT_FAILURE);
	return 0;
}