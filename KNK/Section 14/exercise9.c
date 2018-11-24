#include <stdio.h>

#define CHECK(x,y,n) (((x)>=0&&(x)<=((n)-1))&&((y)>=0&&(y)<=((n)-1))?1:0)
#define MEDIAN(x,y,z) ((x)>(y)?((z)>(x)?(x):((y)>(z))?(y):(z)):((z)>(y)?(y):((x)>(z)?(x):(z))))
#define POLYNOMIAL(x) (3*(x)*(x)*(x)*(x)*(x)+2*(x)*(x)*(x)*(x)-5*(x)*(x)*(x)-(x)*(x)+7*(x)-6)

int main(void)
{	
	printf("%d %d %d", CHECK(1,3,5), MEDIAN(10,5,9), POLYNOMIAL(1));
	
	return 0;
}