#include <stdio.h>

struct fraction {int numerator, denominator;};

struct fraction reduce_fraction(struct fraction f);
struct fraction add_fractions(struct fraction f1, struct fraction f2);
struct fraction subtract_fractions(struct fraction f1, struct fraction f2);
struct fraction multiply_fractions(struct fraction f1, struct fraction f2);
struct fraction divide_fractions(struct fraction f1, struct fraction f2);

int main(void)
{
	struct fraction f, f1 = {7, 8}, f2 = {3, 4};
	
	f = add_fractions(f1, f2);
	printf("%d/%d + %d/%d = %d/%d\n", f1.numerator, f1.denominator, f2.numerator, f2.denominator, f.numerator, f.denominator);
	
	f = subtract_fractions(f1, f2);
	printf("%d/%d - %d/%d = %d/%d\n", f1.numerator, f1.denominator, f2.numerator, f2.denominator, f.numerator, f.denominator);
	
	f = multiply_fractions(f1, f2);
	printf("%d/%d * %d/%d = %d/%d\n", f1.numerator, f1.denominator, f2.numerator, f2.denominator, f.numerator, f.denominator);
	
	f = divide_fractions(f1, f2);
	printf("%d/%d / %d/%d = %d/%d\n", f1.numerator, f1.denominator, f2.numerator, f2.denominator, f.numerator, f.denominator);
	
	return 0;
}

struct fraction reduce_fraction(struct fraction f)
{
	int tmp, numerator = f.numerator, denominator = f.denominator, GCD;
	
	for (; numerator != 0; tmp = numerator, numerator = denominator % tmp, denominator = tmp)
		;
	GCD = denominator;

	f.numerator /= GCD;
	f.denominator /= GCD;
	
	return f;
}

struct fraction add_fractions(struct fraction f1, struct fraction f2)
{
	struct fraction f;
	
	f.numerator = f1.numerator * f2.denominator + f2.numerator * f1.denominator;
	f.denominator = f1.denominator * f2.denominator;
	f = reduce_fraction(f);
	
	return f;
}

struct fraction subtract_fractions(struct fraction f1, struct fraction f2)
{
	struct fraction f;
	
	f.numerator = f1.numerator * f2.denominator - f2.numerator * f1.denominator;
	f.denominator = f1.denominator * f2.denominator;
	f = reduce_fraction(f);
	
	return f;
}

struct fraction multiply_fractions(struct fraction f1, struct fraction f2)
{
	struct fraction f;
	
	f.numerator = f1.numerator * f2.numerator;
	f.denominator = f1.denominator * f2.denominator;
	f = reduce_fraction(f);
	
	return f;
}

struct fraction divide_fractions(struct fraction f1, struct fraction f2)
{
	struct fraction f;
	
	f.numerator = f1.numerator * f2.denominator;
	f.denominator = f1.denominator * f2.numerator;
	f = reduce_fraction(f);
	
	return f;
}