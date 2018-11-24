#include <stdio.h>
#include <ctype.h>

float compute_GPA(char grades[], int n);

int main()
{
	char grades[] = {'a', 'a', 'b', 'b', 'b', 'c', 'c', 'c', 'c', 'd', 'd', 'f'};
	int size = (int) sizeof(grades) / sizeof(grades[0]);
	
	printf("The grade point average is %g", compute_GPA(grades, size));
		
	return 0;
}

float compute_GPA(char grades[], int n)
{
	int grade_sum = 0;
	
	for (int i = 0; i < n; i++)
	{
		switch (toupper(grades[i]))
		{
			case 'A': grade_sum += 4; break;
			case 'B': grade_sum += 3; break;
			case 'C': grade_sum += 2; break;
			case 'D': grade_sum += 1; break;
			case 'F': break;
		}
	}
	
	return grade_sum * 1.0 / n;
}