#=

Q.

There are three possibilities for the balance of an interior node of an
AVL tree: 0, +1, or -1. But leaves always have balance 0. Show
how this fact can be used to provide a representation for AVL trees
in which the balance field of each node is only a single bit.

A.

Set 0 bit of balance for an internal node when a left height is larger than a right one, and vice versa.
Even if balance is zero, the RR or RL rotation will be performed, but they don't corrupt AVL-tree(balance after rotation is -1).
Set 0 bit of balance for a leaf because its balance is always zero.

=#
