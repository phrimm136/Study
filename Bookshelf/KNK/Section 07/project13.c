#include <stdio.h>

int main()
{
	char word = '\0';
	double avg_length;
	int length_sum = 0, length_now = 0, number_of_words = 0;
	
	printf("Enter a sentence: ");
	while (1)
	{
		word = getchar();
		if (word == '\n')
		{
			length_sum += length_now;
			number_of_words++;
			length_now = 0;
			break;
		}
		else if (word == ' ')
		{
			length_sum += length_now;
			number_of_words++;
			length_now = 0;
		}
		else
			length_now++;
	}
	avg_length = length_sum * 1.0 / number_of_words;
	
	printf("Average word length: %.1f", avg_length);
	
	return 0;
}