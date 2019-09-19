#=

Q.

Show how to find the largest and next-to-largest elements of a table
of length n by using only about n + lg n comparisons.

A.

Like exercise 30, hold a tournament to find the max value.
After findding it, track back the comparisons between the max value
and its competitor to find the second largest value.
The tournament takes n-1, and backtracking lg(n).

=#
