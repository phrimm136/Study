#=

Q.

Suppose that S and T are sets of size m and n, where m <= n. Choose
a representation that makes it possible to implement Intersection(S, T)
(which returns S & T) in time O((m+n)log m).

A.

With inorder traversion in S and T, we can find the common elements.
Since they are ordered, we can push them into the root and rotate if neccessary.
Searching for rotation takes O(log m) (m <= n, so the size is at most m.), and traversion takes O(m+n).
Thus, the intersection function runs in time O((m+n)log m).

=#
