#=

Q.

One situation in which hashing with separate chaining may present
problems is when the size of a record is comparable to the size of a
pointer; then separate chaining may devote too large a percentage of
memory to the pointers that hold the chains together. Assume that the
total number of records is very large, so that it is impractical to use
a single large hash table with open addressing. Devise and analyze a
variation on the separate chaining algorithm that dynamically allocates
blocks of memory larger than single linked list cells.

A.

Assume that we insert items which take memory similarly to pointers.
If we allocate memory blocks which can have one next node pointer and lots of items, fill them and then allocate other ones,
we can reduce memory for pointer, which is divided by the number of item capacity of each block.

=#
