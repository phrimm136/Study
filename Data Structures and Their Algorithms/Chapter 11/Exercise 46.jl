#=

Q.

Let k be a fixed positive integer. Describe a simple nonrecursive
algorithm that finds the kth smallest of a set of n numbers.

A.

In loop,
if n_> > k then T = T_>, m = n_>
else if n_> + n_= > k then return m
else T = T_<, m = n_<, k -= n_> + n_=

=#
