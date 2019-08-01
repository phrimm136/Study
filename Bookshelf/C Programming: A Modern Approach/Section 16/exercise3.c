#include <stdio.h>

struct complex make_complex(double real, double imaginary);
struct complex add_complex(struct complex c1, struct complex c2);

struct complex {double real, imaginary;};

int main(void)
{
	struct complex c1 = {1.0, 2.0}, c2 = {2.0, 1.0}, c3;
	
	printf("%f %f\n%f %f\n", c1.real, c1.imaginary, c2.real, c2.imaginary);
	
	c3 = make_complex(c1.real, c2.imaginary);
	printf("%f %f\n", c3.real, c3.imaginary);
	
	c3 = add_complex(c1, c2);
	printf("%f %f\n", c3.real, c3.imaginary);
	
	return 0;
}

struct complex make_complex(double real, double imaginary)
{
	struct complex comp;
	
	comp.real = real;
	comp.imaginary = imaginary;
	
	return comp;
}

struct complex add_complex(struct complex c1, struct complex c2)
{
	struct complex comp;
	
	comp.real = c1.real + c2.real;
	comp.imaginary = c1.imaginary + c2.imaginary;
	
	return comp;
}