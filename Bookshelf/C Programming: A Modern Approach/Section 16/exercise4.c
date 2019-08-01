#include <stdio.h>

typedef struct {double real, imaginary;} Complex;

Complex make_complex(double real, double imaginary);
Complex add_complex(Complex c1, Complex c2);

int main(void)
{
	Complex c1 = {1.0, 2.0}, c2 = {2.0, 1.0}, c3;

	printf("%f %f\n%f %f\n", c1.real, c1.imaginary, c2.real, c2.imaginary);

	c3 = make_complex(c1.real, c2.imaginary);
	printf("%f %f\n", c3.real, c3.imaginary);

	c3 = add_complex(c1, c2);
	printf("%f %f\n", c3.real, c3.imaginary);

	return 0;
}

Complex make_complex(double real, double imaginary)
{
	Complex comp;

	comp.real = real;
	comp.imaginary = imaginary;

	return comp;
}

Complex add_complex(Complex c1, Complex c2)
{
	Complex comp;

	comp.real = c1.real + c2.real;
	comp.imaginary = c1.imaginary + c2.imaginary;

	return comp;
}