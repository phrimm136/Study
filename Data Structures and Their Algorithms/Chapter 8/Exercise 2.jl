#=

Q.

a. With the data structure of Algorithm 8. 1, the operation IsEmptySet
cannot be implemented in constant time. Describe the changes
needed to make this possible, while preserving the performance
of the other operations.

b. Can the function Size(S), which returns the number of elements
in S, be implemented torun in constant time?

A.

a.

Instead of bit vector, set a sum variable which is initially zero.
When inserting, add 2^i to sum, and when deleting, subtract from it.
To find whether Bits[i] == 1, sum xor 2^i.
If sum is zero, then the vector is empty.

b.

No, even if it is implemented like above method, division should be iterated to get the size of vector.
