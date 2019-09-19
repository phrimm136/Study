#=

Q.

Suppose that we had a linear-time procedure that was guaranteed to
find a pivot element for Quick Sort such that at least 1% of the array
was less than or equal to the pivot and at least 1% was greater than or
equal to the pivot. Show that Quick Sort would then have worst-case
complexity O(n log n).

A.

Since finding a pivot element takes O(n) times, non-recursie part of
quicksort take O(n) times.
