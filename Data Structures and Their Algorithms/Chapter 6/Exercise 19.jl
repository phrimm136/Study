#=

Q.

Suppose you would like to search a list of keys K_1, ... , K_n whose probabilities of being sought decrease geometrically: p_i = a * p_(i-1), for each i such that 1 < i <= n, where a is a constant in the range O < a < 1.

a. Show that p_1 must be about 1/(1 - a).

b. Under what circumstances, if any, would linear search be preferable to binary search? For example, if we regard a as fixed, is there a minimum n at which one method becomes preferable to the other?

A.

a.

(sigma i from 1 to n p_i) = p_1 + a*p_1 + a^2*p_1 + a^3*p_1 + ... a^(n-1)*p_1 = p_1(1 + a + a^2 + ... + a^(n-1)) = p_1 * (1 - a^(n-1))/(1 - a) = 1. So p_1 is about 1 - a. Something strange...

b.

If we meet a point that a difference between (sigma i from 1 to n a^(i-1)*(i - floor(logi+1))) is acceptable (a^(n-1)*(n - floor(logn+1)) quickly drops to 0), the search algorithms are both preferable.

=#
