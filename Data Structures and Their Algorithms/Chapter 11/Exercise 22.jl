#=

Q.

This problem concerns Quick Sort, Algorithms 11.6 and 11.7.

a. How many comparisons does Algorithm 11.6 make if the table is
of length n and is in order to begin with?

b. How many comparisons does Algorithm 11.7 make if the table is
of length n and is in order to begin with?

c. How many comparisons does Algorithm 11.7 make if the table is
of length n and is in reverse order to begin with?

A.

a.

  (2n + 2(n-1) + ... + 4) + 2(n-1)(i < r, i < j for n >= 2) + n(length 1 blocks)
= n(n+1) + 3n - 4 = n^2 + 4n - 4

b.

C(n) = n + 2 + C(floor((n-1)/2)) + C(ceil((n-1)/2)) (n >= 3), 1 (n < 3)

c.

7 6 5 4 3 2 1
1 6 5 4 3 2 7
1 4 5 6 3 2 7
1 4 2 6 3 5 7
1 4 2 3 6 5 7
1 3 2 4 6 5 7

C(n) = n + 2 + C(floor((n-1)/2)) + C(ceil((n-1)/2)) (n >= 3), 1 (n < 3)

=#
