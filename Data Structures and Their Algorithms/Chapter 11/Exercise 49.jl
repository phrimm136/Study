#=

Q.

It is not hard to develop a version of the linear-time algorithm for
finding the median that works by segmenting the table into blocks
of length 7 or 9. How might a version of the algorithm work that
uses blocks of an even length, such as 6 or 8? Can the blocks be of
length 3 or 4?

A.

Since median of even numbers is average of T[n] and T[n+1],
we should pick two elements from each block.
Except that, there is no change of the algorithm.
We can get a median from a block of length 3 or 4,
so those also can be the blocks for algorithm.

=#
