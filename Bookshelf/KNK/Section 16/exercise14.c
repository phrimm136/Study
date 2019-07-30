#include <stdio.h>

#define PI 3.14
#define RECTANGLE 0
#define CIRCLE 1

struct point {int x, y;};
struct shape {int shape_kind;		// RECTANGLE or CIRCLE
			  struct point center;  // coordinates of center
			  union {struct {int height, width;} rectangle;
					 struct {int radius;} circle;
					} u;
			 } s;

int area_of_shape(struct shape s);
struct shape move_center_of_shape(struct shape s, int x, int y);
struct shape scale_shape(struct shape s, double c);

int main(void)
{
	int area;
	
	s.center.x = 3;
	s.center.y = 4;
	s.shape_kind = RECTANGLE;
	s.u.rectangle.width = 25;
	s.u.rectangle.height = 8;
	
	area = area_of_shape(s);
	if (s.shape_kind == RECTANGLE)
		printf("area of rectangle: %d\n", area);
	else if (s.shape_kind == CIRCLE)
		printf("area of circle: %d\n", area);
	
	s = move_center_of_shape(s, 4, 3);
	printf("The new center of shape is (%d,%d)\n", s.center.x, s.center.y);
	
	s = scale_shape(s, 1.5);
	area = area_of_shape(s);
	if (s.shape_kind == RECTANGLE)
		printf("area of rectangle: %d\n", area);
	else if (s.shape_kind == CIRCLE)
		printf("area of circle: %d\n", area);
	
	return 0;
}

int area_of_shape(struct shape s)
{
	int area;
	
	if (s.shape_kind == RECTANGLE)
		area = s.u.rectangle.width * s.u.rectangle.height;
	else if (s.shape_kind == CIRCLE)
		area = s.u.circle.radius * s.u.circle.radius * PI;
	
	return area;
}

struct shape move_center_of_shape(struct shape s, int x, int y)
{
	s.center.x += x;
	s.center.y += y;
	
	return s;
}

struct shape scale_shape(struct shape s, double c)
{
	if (s.shape_kind == RECTANGLE)
	{
		s.u.rectangle.width *= c;
		s.u.rectangle.height *= c;
	}
	else if (s.shape_kind == CIRCLE)
		s.u.circle.radius *= c;
	
	return s;
}