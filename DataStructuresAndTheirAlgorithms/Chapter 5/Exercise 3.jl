#=

Q.

Suppose M is a k-dimensional array stored in contiguous memory starting at address 'M'.
Element M[l_1, l_2, ... , l_k] of M is located at address 'M' whether M is stored in row-major or column-major order. Which other elements of M (if any) have this property?

A.

The last element M[u_1, u_2, ... , u_l] is always located at address 'M' + (l_1 .. u_1) * ... * (l_k .. u_k) regardless of the order.

=#
