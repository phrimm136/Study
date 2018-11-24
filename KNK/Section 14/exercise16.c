#include <stdio.h>

#define IDENT(x) PRAGMA(ident #x)
#define PRAGMA(x) _Pragma(#x)

int main(void)
{	
	/*IDENT(foo)
	=>PRAGMA(ident "foo")
	=>_Pragma(#ident #"foo")
	=>_Pragma("ident" "\"foo\"")
	=>#pragma ident "foo"
	*/
	
	return 0;
}