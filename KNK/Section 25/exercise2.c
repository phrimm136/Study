#include <stdio.h>
#include <locale.h>

int main(void)
{
	setlocale(LC_ALL, "en_GB"); // chcp 932
	
	wprintf(L"\x05\x87\x80\x36\xed\xaa\n");
	wprintf(L"\x20\xe4\x50\x88\x3f\n");
	wprintf(L"\xde\xad\xbe\xef\n");
	wprintf(L"\x8a\x60\x92\x74\x41\n");
	
	return 0;
}