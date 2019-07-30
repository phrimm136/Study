#include <stdio.h>
#include <time.h>

int main(void)
{
	struct tm t1 = {0}, t2 = {0};
	time_t t_1, t_2;
	int year, month;

	printf("Enter the first date(mm-dd-yyyy): ");
	scanf("%d-%d-%d", &month, &t1.tm_mday, &year);
	t1.tm_mon = month - 1;
	t1.tm_year = year - 1900;
	
	printf("Enter the second date(mm-dd-yyyy): ");
	scanf("%d-%d-%d", &month, &t2.tm_mday, &year);
	t2.tm_mon = month - 1;
	t2.tm_year = year - 1900;
	
	t_1 = mktime(&t1);
	t_2 = mktime(&t2);

	printf("Difference: %d", (int) difftime(t_2, t_1) / 86400);

	return 0;
}