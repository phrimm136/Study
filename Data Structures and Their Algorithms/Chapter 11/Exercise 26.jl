#=

Q.

a. Given a table of length n in which the first n - ceil(√n) items
are sorted but nothing is known about the last ceil(√n) items, how
would you sort the entire table in 0(n) time in the worst case?

b. Find a larger function f(n) such that √n ∈ o(f) and such that a
table of length n can be sorted in linear time in the worst case
when the first n - f(n) entries are known to be in order. How
big can f be?

A.

a.

Sort the last items with any method(even naive one), which takes O(n)
in the worst case, then merge two parts by swapping the elements of them
scanning from the first to the last of each (O(n)).
Thus, the total time consumption is O(n).

b.

Let S(n) time consumption of algorithm 11.7 for sorting n elements.
S(f(n)) = k*f*log(f) <= k_1*n, lim n-> ∞ √n/f(n) = 0.
Since lg n < n^(1/2), n^p*n^(p/2) < n <=> n^(2/3)

=#
