#=

Q.

a. Suppose that H_1 and H_2 are two heaps of size n_1 and n_2, that
n_1 >= n_2, and that every element of H_2 is greater than every
element of H_1. Explain how to merge H_1 and H_2 into a single
heap in time O(n_1).

b. Why is the condition n_1 >= n_2 needed, and how quickly can the
heaps be merged if this condition is violated?

A.

a.

Reallocate 2*n_1 size array, move all elements of H_1 and
H_2 after the last element of H_1.
Since the total number of elements is n_1 to 2n_1, so
it takes O(n_1) tims.

b.

With that condition, we can set upper bound for reallocation,
which is 2n_1.
Without this, the time for merge should be O(n_1 + n_2).

=#
