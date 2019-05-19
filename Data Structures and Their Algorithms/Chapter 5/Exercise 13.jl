#=

Q.

Define a tridiagonal matrix of order n to be an array with index set (O .. n-1) x (O .. n-1) in which all nonzero entries are on either the main diagonal or one of the two adjacent, parallel diagonals. 
That is, for each i the only possible nonzero elements whose first index is i are M[i,i-1], M[i,i], and M[i,i+1].

a. How many nonzero elements are contained in a tridiagonal matrix of order n?

b. Find a representation for tridiagonal matrices that wastes no storage and such that the address of M[i, j] can be computed from i and j in as few arithmetic operations as possible.
As usual, L is the length of a single element; operations involving only L, n, and the starting address of M can be "precomputed" and don't count.

A.

a.

2n-1 elements.

b.

In upper-tridiagonal matrix, if j is not in [i, i+1] return 0, else return the value of M + L(i + j).
In lower-tirdiagonal matirx, if j is not in [i-1, i] return 0, else return the value of M + L(i + j).

=#
