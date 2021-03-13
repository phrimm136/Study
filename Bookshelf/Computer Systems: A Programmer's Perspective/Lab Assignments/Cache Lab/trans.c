/*
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include "cachelab.h"
#include <stdio.h>

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/*
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded.
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
/* https://mcginn7.github.io/2020/02/23/CSAPP-cachelab/ */
#define MIN(a, b) ((a) > (b) ? (b) : (a))
    int i, j, ii, jj;
    int a[8];

    for (ii = 0; ii < N; ii += 8)
    {
        for (jj = 0; jj < M; jj += 8)
        {
            if (ii != jj || ii + 8 > MIN(M, N) || jj + 8 > MIN(M, N))
            {
                for (j = jj; j < MIN(M, jj + 8); ++j)
                    a[j - jj] = A[ii][j];
                for (j = jj; j < MIN(M, jj + 4); ++j)
                    B[j][ii] = a[j - jj];

                for (i = ii + 1; i < MIN(N, ii + 8); ++i)
                {
                    for (j = jj; j < MIN(M, jj + 4); ++j)
                        a[j - jj] = A[i][j];
                    for (j = jj; j < MIN(M, jj + 4); ++j)
                        B[j][i] = a[j - jj];
                }
                for (i = MIN(N, ii + 8) - 1; i >= ii + 1; --i)
                {
                    for (j = jj + 4; j < MIN(M, jj + 8); ++j)
                        a[j - jj - 4] = A[i][j];
                    for (j = jj + 4; j < MIN(M, jj + 8); ++j)
                        B[j][i] = a[j - jj - 4];
                }

                for (j = jj + 4; j < MIN(M, jj + 8); ++j)
                    B[j][ii] = a[j - jj];
            }
            else
            {
                a[0] = ii;
                ii = jj;
                jj = a[0];
                for (i = 0; i < 4; ++i)
                {
                    for (j = 0; j < 8; ++j)
                        a[j] = A[jj + i][ii + j];
                    for (j = 0; j < 8; ++j)
                        B[ii + i][jj + j] = a[j];
                }
                for (i = 0; i < 4; ++i)
                {
                    for (j = i + 1; j < 4; ++j)
                    {
                        a[0] = B[ii + i][jj + j];
                        B[ii + i][jj + j] = B[ii + j][jj + i];
                        B[ii + j][jj + i] = a[0];
                    }
                }
                for (i = 0; i < 4; ++i)
                {
                    for (j = i + 1; j < 4; ++j)
                    {
                        a[0] = B[ii + i][jj + 4 + j];
                        B[ii + i][jj + 4 + j] = B[ii + j][jj + 4 + i];
                        B[ii + j][jj + 4 + i] = a[0];
                    }
                }
                for (i = 4; i < 8; ++i)
                {
                    for (j = 0; j < 8; ++j)
                        a[j] = A[jj + i][ii + j];
                    for (j = 0; j < 8; ++j)
                        B[ii + i][jj + j] = a[j];
                }
                for (i = 0; i < 4; ++i)
                {
                    for (j = i + 1; j < 4; ++j)
                    {
                        a[0] = B[ii + 4 + i][jj + j];
                        B[ii + 4 + i][jj + j] = B[ii + 4 + j][jj + i];
                        B[ii + 4 + j][jj + i] = a[0];
                    }
                }
                for (i = 0; i < 4; ++i)
                {
                    for (j = i + 1; j < 4; ++j)
                    {
                        a[0] = B[ii + 4 + i][jj + 4 + j];
                        B[ii + 4 + i][jj + 4 + j] = B[ii + 4 + j][jj + 4 + i];
                        B[ii + 4 + j][jj + 4 + i] = a[0];
                    }
                }
                for (i = 0; i < 4; ++i)
                {
                    for (j = 0; j < 4; ++j)
                        a[j] = B[ii + 4 + i][jj + j];
                    for (j = 4; j < 8; ++j)
                        a[j] = B[ii + i][jj + j];
                    for (j = 4; j < 8; ++j)
                        B[ii + i][jj + j] = a[j - 4];
                    for (j = 0; j < 4; ++j)
                        B[ii + 4 + i][jj + j] = a[j + 4];
                }
                a[0] = ii;
                ii = jj;
                jj = a[0];
            }
        }
    }
}

/*
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started.
 */

/*
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; j++)
        {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc);

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc);
}

/*
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}
