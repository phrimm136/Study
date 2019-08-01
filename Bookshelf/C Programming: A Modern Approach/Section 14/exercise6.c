#include <stdio.h>
#include <math.h>

#define DISP(f,x) printf(#f"(%g) = %g\n", x, f(x))
#define DISP2(f,x,y) printf(#f"(%g) = %g\n"#f"(%g) = %g\n", x, f(x), y, f(y))

int main(void)
{	
	DISP(sqrt, 3.0);
	DISP2(sqrt, 3.0, 4.0);
	
	return 0;
}