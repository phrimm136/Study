#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NAME_LEN 25

struct part
{
	int number;
	char name[NAME_LEN+1];
	int on_hand;
};

int main(int argc, char *argv[])
{
	FILE *fp_in1, *fp_in2, *fp_out;
	struct part part1, part2;
	int num_read1, num_read2;
	
	if (argc != 4)
	{
		fprintf(stderr, "usage: merge infile1 infile2 outfile\n");
		exit(EXIT_FAILURE);
	}
	
	if ((fp_in1 = fopen(argv[1], "rb")) == NULL)
	{
		fprintf(stderr, "Can't open file %s", argv[1]);
		exit(EXIT_FAILURE);
	}
	if ((fp_in2 = fopen(argv[2], "rb")) == NULL)
	{
		fprintf(stderr, "Can't open file %s", argv[2]);
		exit(EXIT_FAILURE);
	}
	if ((fp_out = fopen(argv[3], "wb+")) == NULL)
	{
		fprintf(stderr, "Can't open file %s", argv[3]);
		exit(EXIT_FAILURE);
	}
	
	num_read1 = fread(&part1, sizeof(struct part), 1, fp_in1);
	num_read2 = fread(&part2, sizeof(struct part), 1, fp_in2);
	
	while (num_read1 == 1 && num_read2 == 1)
	{
		if (part1.number < part2.number)
		{
			fwrite(&part1, sizeof(struct part), 1, fp_out);
			num_read1 = fread(&part1, sizeof(struct part), 1, fp_in1);
		}
		else if (part1.number > part2.number)
		{
			fwrite(&part2, sizeof(struct part), 1, fp_out);
			num_read2 = fread(&part2, sizeof(struct part), 1, fp_in2);
		}
		else
		{
			if (strcmp(part1.name, part2.name) != 0)
				fprintf(stderr, "Names don't match for part %d; using the name %s\n", part1.number, part1.name);
			part1.on_hand += part2.on_hand;
			fwrite(&part1, sizeof(struct part), 1, fp_out);
			num_read1 = fread(&part1, sizeof(struct part), 1, fp_in1);
			num_read2 = fread(&part2, sizeof(struct part), 1, fp_in2);
		}
	}
	
	while (num_read1 == 1)
	{
		fwrite(&part1, sizeof(struct part), 1, fp_out);
		num_read1 = fread(&part1, sizeof(struct part), 1, fp_in1);
	}
	
	while (num_read2 == 1)
	{
		fwrite(&part2, sizeof(struct part), 1, fp_out);
		num_read1 = fread(&part2, sizeof(struct part), 1, fp_in2);
	}
	
	fclose(fp_in1);
	fclose(fp_in2);
	fclose(fp_out);
	
	return 0;
}