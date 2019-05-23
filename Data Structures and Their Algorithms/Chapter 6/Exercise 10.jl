#=

Q.

Suppose that a list of n keys K_1, ... , K_n is to be searched, where
the probability of key K_i being sought is p_i. Suppose moreover that
key K_i costs c_i to read, so that the cost of searching for K_m is the
sum Σ i from 1 to m c_i. Show that the ordering K_1, ..., K_n has the minimum
expected search cost provided that the ratios p_i/c_i are monotone nonincreasing:

p_1/c_1 >= p_2/c_2 >= ... >= p_n/c_n

A.

Since p_i/c_i >= p_j/c_j in i < j which is equal to c_i*(p_j/p_i) <= c_j,
(sigma i from 1 to m c_i) <= c_1/p_1(p_1 + p_2 + ... = p_m).
If p_i/c_i < p_j/c_j <=> c_i*(p_j/p_i) > c_j in some i and j when i < j, then the sum increases.
So the ordering K_1, ..., K_n has the minimum expected search cost when p_1/n_1 >= p_2/c_2 >= ... >= p_n >= c_n.

=#
