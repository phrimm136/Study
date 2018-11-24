#include <stdio.h>

#define INT32_C(n) n##L
#define UINT32_C(n) n##UL
#define INT64_C(n) n##LL
#define UINT64_C(n) n##ULL

int main(void)
{	
	printf("%ld %lu %lld %llu", INT32_C(1234567890), UINT32_C(1234567890), INT64_C(123456789012345678) , UINT64_C(123456789012345678));

	return 0;
}