#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define RANK 0
#define SUIT 1
#define NUM_CARDS 5

int hand[5][2] = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}};
bool straight, flush, four, three;
int pairs;

void read_cards(void);
void analyze_hand(void);
void print_result(void);

int main()
{
	for(;;)
	{
		read_cards();
		analyze_hand();
		print_result();
	}
}

void read_cards(void)
{
	char ch, rank_ch, suit_ch;
	int rank, suit, duplicate_test, cards_read = 0;
	bool bad_card, duplicate_card;
	
	for (; cards_read < NUM_CARDS;)
	{
		bad_card = false;
		duplicate_card = false;
		
		printf("Enter a card: ");
		rank_ch = getchar();
		switch (rank_ch)
		{
			case '0' : 			  exit(EXIT_SUCCESS);
			case '2' :			  rank = 0; break;
			case '3' :			  rank = 1; break;
			case '4' :			  rank = 2; break;
			case '5' :			  rank = 3; break;
			case '6' :			  rank = 4; break;
			case '7' :			  rank = 5; break;
			case '8' :			  rank = 6; break;
			case '9' :			  rank = 7; break;
			case 't' : case 'T' : rank = 8; break;
			case 'j' : case 'J' : rank = 9; break;
			case 'q' : case 'Q' : rank = 10; break;
			case 'k' : case 'K' : rank = 11; break;
			case 'a' : case 'A' : rank = 12; break;
			default : 			  bad_card = true;
		}
		
		suit_ch = getchar();
		switch (suit_ch)
		{
			case 'c' : case 'C' : suit = 0; break;
			case 'd' : case 'D' : suit = 1; break;
			case 'h' : case 'H' : suit = 2; break;
			case 's' : case 'S' : suit = 3; break;
			default: 			  bad_card = true;
		}
		
		while ((ch = getchar()) != '\n')
			if (ch != ' ') bad_card = true;
		
		for(duplicate_test = 0; duplicate_test < cards_read; duplicate_test++)
		{
			if (hand[duplicate_test][RANK] == rank && hand[duplicate_test][SUIT] == suit)
			{
				duplicate_card = true;
				break;
			}
		}

		if (bad_card)
			printf("Bad card; ignored.\n");
		else if (duplicate_card)
			printf("Duplicate card; ignored.\n");
		else
		{
			hand[cards_read][RANK] = rank;
			hand[cards_read][SUIT] = suit;
			cards_read++;
		}
	}
}

void analyze_hand(void)
{
	int rank, suit, pass, card, run;
	
	straight = false;
	flush = false;
	four = false;
	three = false;
	pairs = 0;
	
	for (pass = 0; pass < NUM_CARDS - 1; pass++)
	{
		for (int card = 0; card < NUM_CARDS - 1 - pass; card++)
		{
			rank = hand[card][RANK];
			suit = hand[card][SUIT];
			if (hand[card][RANK] < rank)
			{
				hand[card][RANK] = hand[card + 1][RANK];
				hand[card][SUIT] = hand[card + 1][SUIT];
				hand[card + 1][RANK] = rank;
				hand[card + 1][SUIT] = suit;
			}
		}
	}
	
	for (int i = 0; i < NUM_CARDS - 1; i++)
	{
		if (hand[i][1] != hand[i + 1][1])
			break;
		flush = true;
	}
		
	for (card = 0; card < NUM_CARDS - 1; card++)
	{
		if (hand[card][RANK] + 1 != hand[card + 1][RANK])
			break;
		straight = true;
	}
	
	for (card = 0; card < NUM_CARDS - 1;)
	{
		rank = hand[card][RANK];
		run = 0;
		do
		{
			run++;
			card++;
		}
		while (card < NUM_CARDS && hand[card][RANK] == rank);
		switch (run)
		{
			case 2 : pairs++; break;
			case 3 : three = true; break;
			case 4 : four = true; break;
		}
	}
}

void print_result(void)
{
	if (straight && flush)		   printf("Straight flush");
	else if (four)				   printf("Four of a kind");
	else if (three && pairs == 1) printf("Full house");
	else if (flush)				   printf("Flush");
	else if (straight)			   printf("Straight");
	else if (three)				   printf("Three of a king");
	else if (pairs == 2)		   printf("Two pairs");
	else if (pairs == 1)		   printf("pair");
	else						   printf("High card");
	
	printf("\n\n");
}