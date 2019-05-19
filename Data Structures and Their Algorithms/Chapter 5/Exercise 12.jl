#=

Q.

Upper-triangular matrices may be generalized to higher dimensions.
A k-dimensional upper-triangular matrix of order n is an array M with k indices each between 0 and n- 1, where M[i_1, i_2, ... , i_k] is zero unless i_1 <= i_2 <= ... <= i_k.

a. How many nonzero elements are contained in a k-dimensional upper-triangular matrix of order n?

b. Show how to represent k-dimensional upper-triangular matrices in contiguous memory so that no space is wasted.

A.

a.

S(n, k) is number of nonzero elements contained in a k-dimensional upper-triangular matrix of order n, which is (sigma i from 1 to n S(i, k-1) in k > 2, n in k = 1), n is length of each axis and k is number of dimension.

b.

At i_1, i_2, ... , i_k (row-first order), append n - (i_1 + i_2 + ... + i_(k-1)) elements.
To find index M[i_1, i_2, ..., i_k], unless i_1 <= i_2 <= ... <= i_k return 0, else return the value of M + L(sigma i from n-i_1 to n S(i, k-1) + (sigma i from n-i_1-i_2 to n S(i, k-2) + ... + (sigma i from n - (i_1 + i_2 + ... + i_(k-1)) to n S(i, 1)) ... ))
