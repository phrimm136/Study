#include <stdio.h>

int main()
{
	double input, result = 0;
	char operator = '\0';
	
	printf("Enter an expression: ");
	while (operator != '\n')
	{
		scanf("%lf", &input);
		if (operator == '\0')
			result = input;
		else
		{
			if (operator == '+')
				result += input;
			if (operator == '-')
				result -= input;
			if (operator == '*')
				result *= input;
			if (operator == '/')
				result /= input;
		}
		operator = getchar();
	}
	printf("value of expression: %g", result);
	
	return 0;
}