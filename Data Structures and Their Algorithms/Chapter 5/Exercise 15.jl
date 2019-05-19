#=

Q.

A checkerboard is a multidimensional array in which the sum of the indices of each nonnull element is even. Devise a space-efficient representation for checkerboards in contiguous memory.

A.

C[i][j] = C + L(ceil(i*j/2) + ceil(j/2))

C[i_1, i_2, ... , i_k] = C + L(ceil(i_1*i_2*i_3*...*i_k/2^(k-1)) + ceil(i_2*i_3*...*i_k/2^(k-1)) + ... + ceil(i_k/w^(k-1)))

=#
