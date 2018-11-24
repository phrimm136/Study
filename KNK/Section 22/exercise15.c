#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	FILE *fp = fopen("inventory.dat", "r+");
	
	fseek(fp, 64 * n, SEEK_SET);
	fseek(fp, -63, SEEK_END);
	fseek(fp, 64, SEEK_CUR);
	fseek(fp, -64 * 2, SEEK_CUR);
	
	return 0;
}