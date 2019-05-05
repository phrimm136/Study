#=

Q.

Upper-triangular matrices may be generalized to higher dimensions.
A k-dimensional upper-triangular matrix of order n is an array M with k indices each between 0 and n- 1, where M[i_1, i_2, ... , i_k] is zero unless i_1 <= i_2 <= ... <= i_k.

a. How many nonzero elements are contained in a k-dimensional upper-triangular matrix of order n?

b. Show how to represent k-dimensional upper-triangular matrices in contiguous memory so that no space is wasted.

A.

a.

(n+k-1)C(k) elements. (0 <= i_1 <= i_2 <= ... <= i_k <= n-1)

b.

At i_1, i_2, ... , i_k (row-first order), append n - (i_1 + i_2 + ... + i_k) elements.
To find index M[i_1, i_2, ..., i_k], unless i_1 <= i_2 <= ... <= i_k return 0, else return the value of M + L(sigma i from 1 to n (i+k-1)C(k) - (sigma i from 1 to n-i_1 (i+k-1)C(k) + (sigma i from 1 to n - (i_1 + i_2) (i+k-2)C(k-1) + ... + (sigma i from 1 to n - (i_1 + i_2 + ... + i_(k-1)) i))))
