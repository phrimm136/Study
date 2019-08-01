#include <stdio.h>
#include <stdlib.h>

struct point{int x, y;};
struct rectangle{struct point upper_left, lower_right;};
struct rectangle *p;

int main(void)
{
	p = malloc(sizeof(p));
	
	p->upper_left.x = 10;
	p->upper_left.y = 25;
	p->lower_right.x = 20;
	p->lower_right.y = 15;
	
	printf("upper_left: (%d,%d), lower_right: (%d,%d)\n",
			p->upper_left.x, p->upper_left.y, p->lower_right.x, p->lower_right.y);
	
	return 0;
}