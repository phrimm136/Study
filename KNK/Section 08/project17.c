#include <stdio.h>

int main()
{
	int n, cursor_row, cursor_column;
	
	printf("This program creates a magic square of a specified size.\n");
	printf("The size must be an odd number between 1 and 99.\n");
	printf("Enter size of magic square: ");
	scanf("%d", &n);
	
	int magic_square[n][n];
	cursor_row = 0, cursor_column = n / 2;
	
	for (int i = 1; i <= n * n; i++)
	{
		magic_square[cursor_row][cursor_column] = i;
		if (i % n == 0)
			cursor_row++;
		else
		{
			cursor_row--;
			cursor_column++;
		}
		if (cursor_row == -1)
			cursor_row += n;
		if (cursor_row == n)
			cursor_row -= n;
		if (cursor_column == -1)
			cursor_column += n;
		if (cursor_column == n)
			cursor_column -= n;
	}
	
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
			printf("%5d", magic_square[i][j]);
		printf("\n");
	}
	
	return 0;
}