/*
Q.

Program the grade school and clever integer multiplication algorithms,
and determine empirically for what size integers, if any,
the clever algorithm is in practice faster than the grade school method.
Does the choice of base affect the threshold value?

A.

Since they are written in pseudo-code on the book, i'll write them in C.

*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define min(x,y) ((x) > (y) ? (y) : (x))
#define max(x,y) ((x) < (y) ? (x) : (x))

int *Binary(int num);
int *GradeSchoolMult(int *B1, int *B2, int n);
int *CleverMult(int *B1, int *B2, int n);
int *Add(int *B1, int *B2, int n, int m);
int *Sub(int *B1, int *B2, int n, int m);
void Accum(int *B1, int *B2, int m);
void PrintResult(int num);

int main(void)
{
    int num;

    printf("%s", "Enter a number to square: "); // To handle problem with ease, I wrote code to square a number.
    scanf("%d", &num);

    PrintResult(num);
        
       
    return 0;
}

int *Binary(int num)
{
    int i = 0, tmp = num;

    while (exp2(i) <= num)
        i++;
   
    int *bin = malloc(i * sizeof(int));

    for (int j = 0; j < i; j++)
    {
        bin[j] = tmp % 2;
        tmp /= 2;
    }

    return bin;    
}

int *GradeSchoolMult(int *B1, int *B2, int n)
{
    int s = 0;
    int *sum = malloc((2*n) * sizeof(int));
    for (int j = 0; j < 2*n; j++)
    {
        for (int i = 0; i < n; i++)
            if ((j-i) >= 0 && (j-i) < n)
                s += B1[i] * B2[j-i];
        sum[j] = s % 2;
        s = (int) floor(s/2);
    }

    return sum;
}

int *CleverMult(int *B1, int *B2, int n)
{
    int m = ceil(n / 2.0);

    if (m <= 3)
        return GradeSchoolMult(B1, B2, n);

    int *X1 = malloc(m * sizeof(int)), *X2 = malloc((n-m) * sizeof(int));
    int *Y1 = malloc(m * sizeof(int)), *Y2 = malloc((n-m) * sizeof(int));

    for (int i = 0; i < m; i++)
    {
        X1[i] = B1[i];
        Y1[i] = B2[i];
    }
    for (int i = m; i < n; i++)
    {
        X2[i-m] = B1[i];
        Y2[i-m] = B2[i];
    }

    int *P1 = CleverMult(X1, Y1, m);
    int *P2 = CleverMult(X2, Y2, n-m);
    int *P3 = CleverMult(Add(X1, X2, m, n-m), Add(Y1, Y2, m, n-m), m+1);

    free(X1);
    free(X2);
    free(Y1);
    free(Y2);

    int *D = Sub(Sub(P3, P1, 2*(m+1), 2*m), P2, 2*(m+1), 2*(n-m));

    int *Z = malloc(2*n*sizeof(int));
    for (int i = 0; i < 2*m; i++)
        Z[i] = P1[i];
    for (int i = 2*m; i < 2*n; i++)
        Z[i] = P2[i-2*m];
    Accum(D, Z+m, (2*(m+1)));

    free(P1);
    free(P2);
    free(P3);
    free(D);

    
    return Z;
}

int *Add(int *B1, int *B2, int n, int m)
{
    int C = 0, S = 0;
    int *L, *R, *sum = malloc(max(n, m) * sizeof(int));

    if (n > m)
    {
        L = B1;
        R = B2;
    }
    else
    {
        L = B2;
        R = B1;
    }

    for (int i = 0; i < min(n, m); i++)
    {
        S = L[i] + R[i] + C;
        sum[i] = S % 2;
        C = S / 2;
    }
    for (int i = min(n, m); i < max(n, m)+1; i++)
    {
        S = L[i] + C;
        sum[i] = S % 2;
        C = S / 2;
    }

    return sum;
}

int *Sub(int *B1, int *B2, int n, int m)
{
    int *diff = malloc(n * sizeof(int));

    for (int i = n-1; i >= m; i--)
        diff[i] = B1[i];
    for (int i = m-1; i >= 0; i--)
        diff[i] = B1[i] - B2[i];
    for (int i = 0; i < n; i++)
        if (diff[i] < 0)
        {
            diff[i+1] -= 1;
            diff[i] += 2;
        }

    return diff;
}

void Accum(int *B1, int *B2, int m)
{
    for (int i = 0; i < m; i++)
    {
        B2[i] += B1[i];
        if (B2[i] > 1)
        {
            B2[i+1] += 1;
            B2[i] -= 2;
        }
    }
}

void PrintResult(int num)
{
    long long int result = 0, digit = floor(log2(num)+1);
    int *sqr1, *sqr2;
    clock_t start;
    double time;

    start = clock();
    sqr1 = GradeSchoolMult(Binary(num), Binary(num), floor(log2(num)+1));
    time = (double) (clock()-start) / CLOCKS_PER_SEC;

    
    for (int i = 0; i < 2*digit; i++)
        if (sqr1[i] != 0)
            result += exp2(i);

    for (int i = 2*digit-1; i >= 0; i--)
        printf("%d", sqr1[i]);
    printf(" %Ld %f\n", result, time);

    result = 0;

    start = clock();
    sqr2 = CleverMult(Binary(num), Binary(num), floor(log2(num)+1));
    time = (double) (clock()-start) / CLOCKS_PER_SEC;

    for (int i = 0; i < 2*digit; i++)
        if (sqr2[i] != 0)
            result += exp2(i);

    for(int i = 2*digit-1; i >= 0; i--)
        printf("%d", sqr2[i]);
    printf(" %Ld %f\n", result, time);
    // Clever multiplication is faster than grade-school multiplication with number power of 2.

    free(sqr1);
    free(sqr2);
}
