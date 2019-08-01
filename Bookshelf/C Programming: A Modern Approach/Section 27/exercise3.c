#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

int main(void)
{	
	int i;
	unsigned int j;
	
	i = 123;
	printf("%" PRId8 " ", (int8_t) i);
	
	i = 12346578;
	printf("%12.4" PRId32 " ", (int32_t) i);
	
	j = 12345;
	printf("%-6" PRIo16 " ", (uint16_t) j);
	
	j = 12345678;
	printf("%#" PRIx64 " ", (uint64_t) j);
	
	return 0;
}