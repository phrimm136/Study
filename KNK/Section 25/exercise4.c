#include <stdio.h>
#include <locale.h>

int main(void)
{
	setlocale(LC_ALL, "Latin-1"); // chcp 1252
	
	wprintf(L"C\xf4te d\'Azur\n");
	wprintf(L"cr\xe8me br\xfbl\xe9""e\n");
	wprintf(L"cr\xe8me fra\xee""che\n");
	wprintf(L"Fahrvergn\xfcgen\n");
	wprintf(L"t\xeate-\xe0-t\xeate\n");
	
	return 0;
}