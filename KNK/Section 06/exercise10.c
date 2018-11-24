#include <stdio.h>

int main()
{
	int i;
		
	i = 10;
	
	while (i >= 1)
	{
		printf("%d ", i++);
		i /= 2;
		if (i > 1)
			continue;
		break;
	}
	
	printf("\n");
	i = 10;
	
	while (i >= 1)
	{
		printf("%d ", i++);
		i /= 2;
		if (i > 1)
			goto loop_end;
		break;
		loop_end: ;
	}
	
	return 0;
}