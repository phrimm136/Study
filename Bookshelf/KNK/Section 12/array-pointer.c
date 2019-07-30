#include <stdio.h>

int main()
{
	int a[10][10], *p, *A[10] = {'\0', '\0'}, (*q)[10] = '\0', b[10];

	for (p = &a[0][0]; p <= &a[9][9]; p++)
	    *p = (int) p;

    for (int i = 0; i < 2; i++)
    {
        int j;
        A[4] = p;
        A[5] = *a;
        A[5] = a[0];
        A[6] = b;
        q = &a[i];
        q = &*(a + i);
        q = &b;
        for (j = 0; j < 1; j++)
            printf("%d %d %d %d %d",
                   a[i][j], *(*(a + i) + j), *(a[i] + j), (*q)[j], *((*q + j)));
        printf("\n");
    }

	return 0;
}