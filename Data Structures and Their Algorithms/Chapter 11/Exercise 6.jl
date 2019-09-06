#=

Q.

Suppose that Shell Sort is run with only a constant number of incre-
ments, independent of n. (The increments themselves might depend
on n, but the same number of increments are used, whether n is 10
or 10 billion.) Show that under these circumstances Shell Sort has
quadratic time complexity.

A.

Assume that h_i = (3^i-1)/2, as given in the book.
if the number number of increments are constant,
the number of constant is ∑ ((n/(h_i)) * (n/(h_i)-1) / 2).
So shell sort has quadrati time complexity.

=#
