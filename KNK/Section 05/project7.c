#include <stdio.h>

int main()
{
	int first, second, third, fourth, max, max_tmp1, max_tmp2, min, min_tmp1, min_tmp2;
	
	printf("Enter four integers: ");
	scanf("%d %d %d %d", &first, &second, &third, &fourth);
	
	max_tmp1 = first > second ? first : second;
	min_tmp1 = first < second ? first : second;
	max_tmp2 = third > fourth ? third : fourth;
	min_tmp2 = third < fourth ? third : fourth;
	max = max_tmp1 > max_tmp2 ? max_tmp1 : max_tmp2;
	min = min_tmp1 < min_tmp2 ? min_tmp1 : min_tmp2;
	
	printf("Largest: %d\n", max);
	printf("Smallest: %d\n", min);
	
	return 0;
}