#include <stdio.h>

#define RECTANGLE 0
#define CIRCLE 1

struct point {int x, y;};
struct shape {int shape_kind;		// RECTANGLE or CIRCLE
			  struct point center;  // coordinates of center
			  union {struct {int height, width;} rectangle;
					 struct {int radius;} circle;
					} u;
			 } s;

int main(void)
{
	s.shape_kind = RECTANGLE;
	s.center.x = 10;
	s.u.rectangle.height = 25;
	s.u.rectangle.width = 8;
	s.u.circle.radius = 5;
	
	return 0;
}