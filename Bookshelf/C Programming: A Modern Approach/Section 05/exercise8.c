#include <stdio.h>
#include <stdbool.h>

int main()
{
	int age;
	bool teenager;
	
	if (age >= 13)
		if (age <= 19)
			teenager = true;
		else
			teenager = false;
	else if (age < 13)
		teenager = false;
	
	//simplify
	
	if (age >= 13 && age <= 19)
		teenager = true;
	else
		teenager = false;
	
	return 0;
}