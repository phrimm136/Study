#include <stdio.h>
#include <stdbool.h>

bool search(int (*a)[24], int n, int key);

int main()
{
	int temperatures[7][24] = {0};
	
	printf("%d", search(temperatures, 24, 32));
	
	return 0;
}

bool search(int (*a)[24], int n, int key)
{
	int *p;
	
	for (int i = 0; i < 7; i++)
		for (p = a[i]; p < a[i] + n; p++)
		{
			if (key == *p)
				return true;
		}
	return false;
}