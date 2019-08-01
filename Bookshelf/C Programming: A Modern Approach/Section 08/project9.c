#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
	char random_walk[10][10] = {{'.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
								{'.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
								{'.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
								{'.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
								{'.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
								{'.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
								{'.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
								{'.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
								{'.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
								{'.', '.', '.', '.', '.', '.', '.', '.', '.', '.'}};
	int row = 0, column = 0, blocked = 0;
		
	srand((unsigned) time(NULL));
	
	for (char ch = 'A'; ch <= 'Z'; ch++)
	{
		random_walk[row][column] = ch;
		
		for(;;)
		{
			if (rand() % 4 == 0 && row > 0 && random_walk[row - 1][column] == '.')
			{	
				row--;
				break;
			}
			if (rand() % 4 == 1 && column > 0 && random_walk[row][column - 1] == '.')
			{	
				column--;
				break;
			}
			if (rand() % 4 == 2 && row < 9 && random_walk[row + 1][column] == '.')
			{
				row++;
				break;
			}
			if (rand() % 4 == 3 && column < 9 && random_walk[row][column + 1] == '.')
			{
				column++;
				break;
			}
			if (random_walk[row - 1][column] != '.' && random_walk[row][column - 1] != '.' &&
				random_walk[row + 1][column] != '.' && random_walk[row][column + 1] != '.')
			{
				blocked = 1;
				break;
			}
		}
		
		if (blocked)
			break;
	}
	
	for (int i = 0; i < 10; i++)
	{
		for (int j = 0; j < 10; j++)
		{
			printf("%c ", random_walk[i][j]);
		}
		printf("\n");
	}
	
	return 0;
}