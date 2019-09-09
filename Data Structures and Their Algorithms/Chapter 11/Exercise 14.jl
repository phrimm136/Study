#=

Q.

Show how to find the k smallest elements of a table of size n in time
O(n logk).

A.

If k=1, then we can take it after initialization in O(n) time.
Otherwise, only k size table need to be sorted and the rest partially
sorted.
So it is enough to heapifying last k elements from the end to the front,
which takes O(n logk) times.

=#
