#include <stdio.h>

typedef enum {empty, pawn, knight, bishop, rook, queen, king} Piece;
typedef enum {black, white} Color;
typedef struct {Piece p; Color c;} Square;

int main(void)
{
	Square board[8][8] = {{{rook, black}, {knight, black}, {bishop, black}, {king, black}, {queen, black}, {bishop, black}, {knight, black}, {rook, black}},
						  {{pawn, black}, {pawn, black}, {pawn, black}, {pawn, black}, {pawn, black}, {pawn, black}, {pawn, black}, {pawn, black}},
						  {{empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}},
						  {{empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}},
						  {{empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}},
						  {{empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}, {empty, black}},
						  {{pawn, white}, {pawn, white}, {pawn, white}, {pawn, white}, {pawn, white}, {pawn, white}, {pawn, white}, {pawn, white}},
						  {{rook, white}, {knight, white}, {bishop, white}, {king, white}, {queen, white}, {bishop, white}, {knight, white}, {rook, white}}};
	
	return 0;
}