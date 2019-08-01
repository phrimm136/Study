#include <stdio.h>

void avg_sum(double a[], int n, double *avg, double *sum);

int main(void)
{
	double a[10], avg, sum;
	
	for (int i = 0; i < 10; i++)
		scanf("%lf", &a[i]);
	
	avg_sum(a, 10, &avg, &sum);
	
	printf("%f", avg);
	
	return 0;
}

void avg_sum(double a[], int n, double *avg, double *sum)
{
	*sum = 0.0;
	for (int i = 0; i < n; i++)
		*sum += a[i];
	*avg = *sum / n;
}