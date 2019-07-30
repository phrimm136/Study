#include <stdio.h>
#include <stdlib.h>

int compar(const void *p, const void *q);

int main(int argc, char *argv[])
{
	FILE *fp;
	int arr[10000], EOF_flag = 0, input_flag = 0, number, ch, member = 0;
	
	if (argc != 2)
	{
		fprintf(stderr, "usage: up-down-median source destination\n");
		exit(EXIT_FAILURE);
	}
	
	if ((fp = fopen(argv[1], "r")) == NULL)
	{
		fprintf(stderr, "Can't open %s\n", argv[1]);
		exit(EXIT_FAILURE);
	}
	
	for (member = 0; member < 10000;)
	{
		number = 0;
		input_flag = 0;
		for (;;)
		{
			ch = fgetc(fp);
			if (ch == '\n' || ch == ' ')
				break;
			if (ch == EOF)
			{
				EOF_flag = 1;
				break;
			}
			input_flag = 1;
			number = number * 10 + (ch - '0');
		}
		if (input_flag)
		{
			arr[member] = number;
			member++;
		}
		
		if (EOF_flag == 1)
			break;
	}
	
	qsort(arr, member, sizeof(int), compar); 
	
	if (member % 2 == 1)
		printf("min: %d, max: %d, median: %d", arr[0], arr[member-1], arr[(member+1)/2]);
	else
		printf("min: %d, max: %d, median: %d", arr[0], arr[member-1], (arr[(member)/2] + arr[(member)/2+1]) / 2);
	
	fclose(fp);
	return 0;
}

int compar(const void *p, const void *q)
{
	int num1 = *(int *)p, num2 = *(int *)q;
	
	if (num1 > num2)
		return 1;
	else if (num1 < num2)
		return -1;
	else
		return 0;
}