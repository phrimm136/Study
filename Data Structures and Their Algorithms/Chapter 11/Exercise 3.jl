#=

Q.

Suppose that A[0..n-1] has the property that no element is more
than k away from its proper position; that is, there is a sorted version
of A, say A[p(0)] ≤ A[p(1)] ≤ ... ≤ A[p(n-1)], where p is a
permutation of {O, ..., n-1}, such that |i-p(i)| ≤ k for each i. Give
an exact upper bound on the number of comparisons A[j - 1] > x
performed by Insertion Sort (Algorithm 11.1 on page 382), and exhibit
a table A for which that is the number of comparisons performed.

A.

k(k-1)/2 * n/k ∈ O(nk)

[5 4 3 2 1 10 9 8 7 6] - permutations of five.

=#
