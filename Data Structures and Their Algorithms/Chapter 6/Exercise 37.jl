#=

Q.

Given an ordered table T[O .. n-1], suppose we search it by a "random 
binary search" strategy. If the range remaining to be searched
is from index Left to Right, instead of probing at position floor((Left +
Right)/2), we probe at a position that is randomly chosen, according
to a uniform distribution, from among Left, Left + 1, ..., Right. What
are the best-case, worst-case, and expected-case performance of this
method?

A.

The best-case performance is O(1), which the random-middle points the key immediately.
The worst-case performance is O(n), which the random-middle only reduces an element.
The expected-case performance is O(logn).
Since searching reduces the size of table randomly, if we denote t(n) time to search with n-length table,
t(n) = (t(1) + t(2) + ... + t(n)) / n + O(1), which is equal to n*t(n) = t(1) + t(2) + ... + t(n) + cn ... f(n).
Substituting n by n-1 yields (n-1)*t(n-1) = t(1) + t(2) + ... + t(n-1) + c(n-1) (t(0) = 0) ... f(n-1).
f(n) - f(n-1) = n*t(n) - (n-1)*t(n-1) = t(n) + c, which is equal to t(n) = t(n-1) + c/(n-1).
So t(n) = c(1/(n-1) + 1/(n-2) + ... + 1/1) = H(n-1) = O(log n) (H(n) is harmonic number.)

=#
