#include <stdio.h>

int main(void)
{
	struct {int x, y;} x = {10, 20}, y;
	
	y = x;
	
	printf("%d %d\n", y.x, y.y);
	
	return 0;
}