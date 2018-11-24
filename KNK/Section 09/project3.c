#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void generate_random_walk(char walk[10][10]);
void print_array(char walk[10][10]);

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
	
	generate_random_walk(random_walk);
	print_array(random_walk);	
	
	return 0;
}

void generate_random_walk(char walk[10][10])
{
	int row = 0, column = 0, blocked = 0;
		
	srand((unsigned) time(NULL));
	
	for (char ch = 'A'; ch <= 'Z'; ch++)
	{
		walk[row][column] = ch;
		
		for(;;)
		{
			if (rand() % 4 == 0 && row > 0 && walk[row - 1][column] == '.')
			{	
				row--;
				break;
			}
			if (rand() % 4 == 1 && column > 0 && walk[row][column - 1] == '.')
			{	
				column--;
				break;
			}
			if (rand() % 4 == 2 && row < 9 && walk[row + 1][column] == '.')
			{
				row++;
				break;
			}
			if (rand() % 4 == 3 && column < 9 && walk[row][column + 1] == '.')
			{
				column++;
				break;
			}
			if (walk[row - 1][column] != '.' && walk[row][column - 1] != '.' &&
				walk[row + 1][column] != '.' && walk[row][column + 1] != '.')
			{
				blocked = 1;
				break;
			}
		}
		
		if (blocked)
			break;
	}
}
void print_array(char walk[10][10])
{
	for (int i = 0; i < 10; i++)
	{
		for (int j = 0; j < 10; j++)
		{
			printf("%c ", walk[i][j]);
		}
		printf("\n");
	}
}