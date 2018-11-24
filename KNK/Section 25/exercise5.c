#include <stdio.h>
#include <locale.h>

int main(void)
{
	setlocale(LC_ALL, "Latin-1"); // chcp 65001
	
	wprintf(L"C\xc3\xb4te d\'Azur\n");
	wprintf(L"cr\xc3\xa8me br\xc3\xbbl\xc3\xa9""e\n");
	wprintf(L"cr\xc3\xa8me fra\xc3\xae""che\n");
	wprintf(L"Fahrvergn\xc3\xbbgen\n");
	wprintf(L"t\xc3\xaate-\xc3\xa0-t\xc3\xaate\n");
	
	return 0;
}