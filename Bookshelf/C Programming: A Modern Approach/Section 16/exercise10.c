#include <stdio.h>
#include <stdbool.h>

struct point {int x, y;};
struct rectangle {struct point upper_left, lower_right;};

int area_of_rectangle(struct rectangle r);
struct point center_of_rectangle(struct rectangle r);
struct rectangle move_rectangle(struct rectangle r, int x, int y);
bool a_location_is_in_the_rectangle(struct rectangle r, struct point p);

int main(void)
{
	struct rectangle r = {{0, 20}, {10, 0}};
	struct point center;
	
	printf("The area of the rectangle is %d\n", area_of_rectangle(r));
	
	center = center_of_rectangle(r);
	printf("The center of the rectangle is (%d,%d)\n", center.x, center.y);
	
	r = move_rectangle(r, 10, 10);
	printf("The new location of rectangle is (%d,%d)(upper_left) and (%d,%d)(lower_right)\n",
		   r.upper_left.x, r.upper_left.y, r.lower_right.x, r.lower_right.y);
	
	if (a_location_is_in_the_rectangle(r, (struct point) {15, 20}))
		printf("True\n");
	else
		printf("False\n");
	
	return 0;
}

int area_of_rectangle(struct rectangle r)
{
	int width, height, area;
	
	width = r.lower_right.x - r.upper_left.x;
	height = r.upper_left.y - r.lower_right.y;
	area = width * height;
	
	return area;
}

struct point center_of_rectangle(struct rectangle r)
{
	struct point center;
	
	center.x = (r.lower_right.x + r.upper_left.x) / 2;
	center.y = (r.upper_left.y + r.lower_right.y) / 2;
	
	return center;
}

struct rectangle move_rectangle(struct rectangle r, int x, int y)
{
	r.upper_left.x += x;
	r.lower_right.x += x;
	r.upper_left.y += y;
	r.lower_right.y += y;
	
	return r;
}

bool a_location_is_in_the_rectangle(struct rectangle r, struct point p)
{
	return ((p.x >= r.upper_left.x && p.x <= r.lower_right.x) && (p.y >= r.lower_right.y && p.y <= r.upper_left.y));
}