#=

Q.

You are given a sequence of n elements to sort.
The input is a sequence of ceil(n/m) subsequences each of length at most m, with all
the elements in each subsequence less than all the elements in the
next.

a. Show that the input can be sorted in time O(n log m).

b. Show that any algorithm for solving this problem takes time
Q(n logm). (It is not sufficient simply to combine the lower
bounds for the subsequences.)

A

a.

Since each subsequence can be sorted in O(m log m) times, ceil(n/m) subsequnces
need O(ceil(n/m)*log(m log m)) ≃ O(n log m).

b.

To split the sequence into subsequences, it is needed to scan it and compare each
adjacent elements(takes O(n) time). Then sort each subsequence.
So the total time consumption is n log m + n ∈ O(n log m).

=#
