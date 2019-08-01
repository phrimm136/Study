#include <stdio.h>
#include <time.h>

int main(void)
{
	struct tm t = {0};
	int year, month, n;

	printf("Enter a date(mm-dd-yyyy): ");
	scanf("%d-%d-%d", &month, &t.tm_mday, &year);
	t.tm_mon = month - 1;
	t.tm_year = year - 1900;

	printf("Enter an integer: ");
	scanf("%d", &n);
	t.tm_mday += n;
	mktime(&t);

	printf("The date %d day(s) later is %d-%d-%d", n, t.tm_mon + 1, t.tm_mday, t.tm_year + 1900);

	return 0;
}