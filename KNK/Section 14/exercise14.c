#include <stdio.h>

#define N 10
#define INC(x) ((x)+1)
#define SUB(x,y) ((x)-(y))
#define SQR(x) ((x)*(x))
#define CUBE(x) (SQR(x)*(x))
#define M1(x,y) x##y
#define M2(x,y) #x #y

int main(void)
{	
	int a[N], i = 10, j = 20, k = 30, m;
	
#ifdef N
	i = j;
#else
	j = i;
#endif
	
	i = 10 * INC(j);
	printf("%d", i);
	i = SUB(j, k);
	printf("%d", i);
	i = SQR(SQR(j));
	printf("%d", i);
	i = CUBE(j);
	printf("%d", i);
	i = M1(j, k);
	printf("%d", i);
	puts(M2(i, j));
	
#undef SQR
	i = SQR(j);
#define SQR
	i = SQR(j);
	
	return 0;
}