#include <stdio.h>

enum chess_pieces {KING, QUEEN, ROOK, BISHOP, KNIGHT, PAWN};

int main(void)
{
	int piece_value[] = {200, 9, 5, 3, 3, 1};
	int Piece_value[] = {[KING] = 200, [QUEEN] = 9, [ROOK] = 5, [BISHOP] = 5, [KNIGHT] = 3, [PAWN] = 1};
	
	return 0;
}