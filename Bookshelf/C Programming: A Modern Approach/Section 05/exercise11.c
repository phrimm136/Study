#include <stdio.h>

int main()
{
	int area_code;
	
	area_code = 470;
	switch (area_code)
	{
		case 229: printf("Blbany"); break;
		case 478: printf("Macon"); break;
		case 912: printf("Savannah"); break;
		case 404:
		case 470:
		case 678:
		case 770: printf("Atlanta"); break;
		case 706:
		case 762: printf("Columbus"); break;
		default: printf("Area code not recognized");
	}
	
	return 0;
}