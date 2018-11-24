#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <ctype.h>
#include <time.h>

int roll_dice(void);
bool play_game(void);

int main()
{
	int wins = 0, loses = 0;
	srand((unsigned) time(NULL));
	
	for(;;)
	{
		if (play_game())
		{
			wins++;
			printf("You win!\n\n");
		}
		else
		{
			loses++;
			printf("You lose!\n\n");
		}
		printf("play again? ");
		if (tolower(getchar()) != 'y')
		{
			printf("\nWins: %d  Losses: %d\n", wins, loses);
			break;
		}
		else
			printf("\n");
		
		getchar();
	}
	
	return 0;
}

bool play_game(void)
{
	int rolled, point;
	
	rolled = roll_dice();
	printf("You rolled: %d\n", rolled);
	if (rolled == 7 || rolled == 11)
		return true;
	else if (rolled == 2 || rolled == 3 || rolled == 12)
		return false;
	else
	{
		point = rolled;
		printf("Your point is %d\n", point);
	}
	for(;;)
	{
		rolled = roll_dice();
		printf("You rolled: %d\n", rolled);
		if (rolled == point)
			return true;
		if (rolled == 7)
			return false;
	}
}

int roll_dice(void)
{
	int sum = 0;
	
	sum += rand() % 6 + 1;
	sum += rand() % 6 + 1;
	
	return sum;
}