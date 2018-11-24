#include <stdio.h>

double compute_average_word_length(const char *sentence);

int main()
{
	char sentence[200];
	
	printf("Enter a sentence: ");
	gets(sentence);
	
	printf("Average word length: %.1f", compute_average_word_length(sentence));
	
	return 0;
}
double compute_average_word_length(const char *sentence)
{
	double avg_length;
	int length_sum = 0, length_now = 0, number_of_words = 0;
	
	for (char *p = sentence;; p++)
	{
		if (*p == '\0')
		{
			length_sum += length_now;
			number_of_words++;
			length_now = 0;
			break;
		}
		else if (*p == ' ')
		{
			length_sum += length_now;
			number_of_words++;
			length_now = 0;
		}
		else
			length_now++;
	}
	
	avg_length = length_sum * 1.0 / number_of_words;
	
	return avg_length;
}