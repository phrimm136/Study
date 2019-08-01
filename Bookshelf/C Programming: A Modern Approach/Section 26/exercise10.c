#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	char *i = "30000", *l = "300000000", *ll = "3000000000000000000";
	printf("%d\n", (int) strtol(i, &i, 10)); // atoi(i);
	printf("%ld\n", strtol(l, &l, 10)); // atol(l);
	printf("%lld\n", strtoll(ll, &ll, 10)); // atoll(ll);
	
	return 0;
}