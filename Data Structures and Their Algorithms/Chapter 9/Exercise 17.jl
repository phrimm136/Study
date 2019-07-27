#=

Q.

a. Where in the proof of the Path Compression Theorem do we use
the assumption that m >= n?

b. Suppose that assumption is violated; what can be said about the
time needed to carry out m operations on a universe of size n if
m < n?

A.

a.

F' <= (sigma from g=0 to log* n) n/F(g) * F(g) ∈ O(n log* n) ⊆ O(m log* n)

b.

If n > m, then O(n log* n) ⊇ O(m log* n), which means that regardless of m,
m operations takes O(n log* n) time. (n/m is propotional to n.)

=#
