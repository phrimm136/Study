#include <stdio.h>

int max(int a[], int n);
double avg(int a[], int n);
int pos_num(int a[], int n);

int main()
{
	int a[] = {1, -2, 3, -4};
	
	printf("the largest value of the array is %d\n", max(a, 4));
	printf("average of the array is %f\n", avg(a, 4));
	printf("the number of positive value of the array is %d", pos_num(a, 4));
		
	return 0;
}

int max(int a[], int n)
{
	int max = a[0];
	
	for (int idx = 1; idx < n; idx++)
		if (max < a[idx])
			max = a[idx];
	
	return max;
}

double avg(int a[], int n)
{
	int sum = 0;
	
	for (int i = 0; i < n; i++)
		sum += a[i];
	
	return sum * 1.0 / n;
}

int pos_num(int a[], int n)
{
	int pos = 0;
	
	for (int i = 0; i < n; i++)
		if (a[i] > 0)
			pos++;
		
	return pos;
}