#include <stdio.h>

int main()
{
	int grade[5][5], student_total[5] = {0}, quiz_total[5] = {0}, max, min;
	
	for (int quiz = 0; quiz < 5; quiz++)
	{
		printf("Enter each grade of quiz %d: ", quiz + 1);
		for (int student = 0; student < 5; student++)
		{
			scanf("%d", &grade[quiz][student]);
		}
	}
	
	printf("The total score for each student: ");
	for (int student = 0; student < 5; student++)
	{
		for (int quiz = 0; quiz < 5; quiz++)
		{
			student_total[student] += grade[quiz][student];
		}
		printf("%d ", student_total[student]);
	}
	printf("\n");
	printf("The average score for each student: ");
	for (int student = 0; student < 5; student++)
		printf("%.2f ", student_total[student] / 5.0);
	printf("\n");
	
	for (int quiz = 0; quiz < 5; quiz++)
	{
		printf("The average score, high score, and low score for quiz %d: ", quiz + 1);
		max = 0; min = 100;
		
		for (int student = 0; student < 5; student++)
		{
			quiz_total[quiz] += grade[quiz][student];
			if (grade[quiz][student] > max)
				max = grade[quiz][student];
			if (grade[quiz][student] < min)
				min = grade[quiz][student];
		}
		printf("%.2f %d %d\n", quiz_total[quiz] / 5.0, max, min);
	}
	
	return 0;
}