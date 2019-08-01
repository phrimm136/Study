#include <stdio.h>
#include <tgmath.h>
#include <math.h>
#include <complex.h>

int main(void) 
{
	int i = 1;
	float f = 2.0;
	double d = 3.0;
	long double ld = 4.0;
	float complex fc = 5.0 + 6.0 * I;
	double complex dc = 7.0 + 8.0 * I;
	long double complex ldc = 9.0 + 10.0 * I;
	
	printf("%d ", sizeof(tan(i))); // 8
	printf("%d ", sizeof(fabs(f))); // 4
	printf("%d ", sizeof(asin(d))); // 8
	printf("%d ", sizeof(exp(ld))); // 16
	printf("%d ", sizeof(log(fc))); // 8
	printf("%d ", sizeof(acosh(dc))); // 16
	printf("%d ", sizeof(nexttoward(d, ld))); // 8
	printf("%d ", sizeof(remainderf(f, i))); // 4
	printf("%d ", sizeof(copysign(d, ld))); // 16
	printf("%d ", sizeof(carg(i))); // 8
	printf("%d ", sizeof(cimag(f))); // 4
	printf("%d ", sizeof(conj(ldc))); // 32
	
	return 0;
}
