#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <errno.h>

#define TRY_MATH_FCN(f, x) try_math_fcn(f, x, "Error in call of "#f)

double try_math_fcn(double (*f)(double), double x, const char *err);

int main(void)
{
	double x = 2;
	
	printf("%g\n", try_math_fcn(sqrt, x, "Error in call of sqrt"));
	
	x = -1;
	printf("%g\n", TRY_MATH_FCN(sqrt, x));
	
	return 0;
}

double try_math_fcn(double (*f)(double), double x, const char *err)
{
	double y;
	
	errno = 0;
	y = (*f)(x);
	if (errno != 0)
	{
		perror(err);
		exit(EXIT_FAILURE);
	}
	else
		return y;
}