#=

Q.

Give the exact formula that should replace the assignment to p in the interpolation search algorithm (Algorithm 6.2 on page 185) in case the LookUps are not uniformly distributed but the function F(K) gives the probability that a LookUp is for a key value less than or equal to K.

A.

p = (F(K) - F(T[left])) / (F(T[right]) - F(T[left]))
