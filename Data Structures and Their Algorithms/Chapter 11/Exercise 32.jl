#=

Q.

Suppose you are given a list of n integers with many duplications, so
that there are only O(log n) distinct numbers in the list.

a. Show how to sort the numbers in time O(n log log n).

b. Why is this result not a violation of the Information-Theoretic
Lower Bound?

A.

Retrieve integers and the number of existence of each.
Then, sort the numbers with O(n logn) sorting algorithm,
and put the elements as many as its occurrence is.
Retrieving and putting take O(n), and sorting revtrived
elements take O(n log log n), so the total time consumption is
O(n log log n).

b.

Because sotring the distinct elements takes O(log m), time, which
m is log n.

=#
