#include <stdio.h>

int main()
{
	int array[5][5], row_total, column_total;
	
	for (int i = 0; i < 5; i++)
	{
		printf("Enter row %d: ", i + 1);
		for (int j = 0; j < 5; j++)
		{
			scanf("%d", &array[i][j]);
		}
	}
	
	printf("Row totals: ");
	for (int i = 0; i < 5; i++)
	{
		row_total = 0;
		for (int j = 0; j < 5; j++)
		{
			row_total += array[i][j];
		}
		printf("%d ", row_total);
	}
	printf("\n");
	printf("Column totals: ");
	for (int j = 0; j < 5; j++)
	{
		column_total = 0;
		for (int i = 0; i < 5; i++)
		{
			column_total += array[i][j];
		}
		printf("%d ", column_total);
	}
	
	return 0;
}