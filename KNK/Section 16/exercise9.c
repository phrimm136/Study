#include <stdio.h>
#include <stdbool.h>

struct color {int red, green, blue;};

struct color make_color(int red, int green, int blue);
int getRed(struct color c);
bool equal_color(struct color color1, struct color color2);
struct color brighter(struct color c);
struct color darker(struct color c);

int main(void)
{
	struct color something, true_green = {0, 255, 0};
	int red = -5, green = 899, blue = 89;
	
	something = make_color(red, green, blue);
	printf("%d %d %d\n", something.red, something.green, something.blue);
	
	printf("Red value of color is %d\n", getRed(something));
	
	if (equal_color(something, true_green))
		printf("Two are equal\n");
	else
		printf("Two are not equal\n");
	
	something = brighter(something);
	printf("%d %d %d\n", something.red, something.green, something.blue);
	
	something = darker(something);
	printf("%d %d %d\n", something.red, something.green, something.blue);
	
	return 0;
}

struct color make_color(int red, int green, int blue)
{
	struct color something;
	
	if (red > 255)
		something.red = 255;
	else if (red < 0)
		something.red = 0;
	else
		something.red = red;
	if (green > 255)
		something.green = 255;
	else if (green < 0)
		something.green = 0;
	else
		something.green = green;
	if (blue > 255)
		something.blue = 255;
	else if (blue < 0)
		something.blue = 0;
	else
		something.blue = blue;
	
	return something;
}

int getRed(struct color c)
{
	return c.red;
}

bool equal_color(struct color color1, struct color color2)
{
	if (color1.red == color2.red && color1.green == color2.green && color1.blue == color2.blue)
		return true;
	else
		return false;
}

struct color brighter(struct color c)
{
	if (c.red == 0 && c.green == 0 && c.blue == 0)
	{
		c.red = 3;
		c.green = 3;
		c.blue = 3;
	}
	
	if (c.red < 3)
		c.red = 3;
	else if (c.red / 0.7 > 255)
		c.red = 255;
	else
		c.red /= 0.7;
	
	if (c.green < 3)
		c.green = 3;
	else if (c.green / 0.7 > 255)
		c.green = 255;
	else
		c.green /= 0.7;
	
	if (c.blue < 3)
		c.blue = 3;
	else if (c.blue / 0.7 > 255)
		c.blue = 255;
	else
		c.blue /= 0.7;
	
	return c;
}

struct color darker(struct color c)
{
	c.red *= 0.7;
	c.green *= 0.7;
	c.blue *= 0.7;
	
	return c;
}