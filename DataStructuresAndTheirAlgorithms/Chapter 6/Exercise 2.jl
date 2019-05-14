#=

Q.

a. In the notation of this section, what is the value of p(i, i)?

b. Compute p(i, j, k), the probability that key K_i precedes key K_j which in turn precedes key K_k. Can you generalize the result?

A.

a.

p(i, i) = p_i/(p_i + p_i) = 1/2

b.

p(i, j, k) = p_i/(p_i + p_j + p_k) * p_j/(p_j + p_k)

p(i_1, i_2, ... , i_k) = p_(i_1)/(p_(i_1) + p_(i_2) + ... p_(i_k)) * p_(i_2)/(p_(i_2) + p_(i_3) + ... p_(i_k)) * ... * p_(i(k-1))/(p_(i_(k-1)) + p_(i_k))

=#
