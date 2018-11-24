#include <stdio.h>

int evaluate_position(char (*board)[8]);

int main()
{
	char board[8][8] = {{'R', 'N', 'B', 'K', 'Q', 'B', 'N', 'R'},
						{'P', 'P', 'P', 'P', 'P', 'P', 'P', 'P'},
						{' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
						{' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
						{' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
						{' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
						{'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p'},
						{'r', 'n', 'b', 'k', 'q', 'b', 'n', 'r'}};
						
	printf("The white has %d advantage(s) in material against black", evaluate_position(board));
	
	return 0;
}

int evaluate_position(char (*board)[8])
{
	int advantage = 0;
	
	for (char *p = board[0]; p < board[0] + 8 * 8; p++)
	{
		switch (*p)
		{
			case 'Q' : advantage += 9; break;
			case 'R' : advantage += 5; break;
			case 'B' : advantage += 3; break;
			case 'N' : advantage += 3; break;
			case 'P' : advantage += 1; break;
			
			case 'q' : advantage -= 9; break;
			case 'r' : advantage -= 5; break;
			case 'b' : advantage -= 3; break;
			case 'n' : advantage -= 3; break;
			case 'p' : advantage -= 1; break;
		}
	}
	
	return advantage;
}	