#=

Q.

Show how to do range searching in one dimension using threaded
trees, and analyze the method you propose.

A.

Find the minimum key from the root, and traverse the tree
with thread until the key of a node is out of range.
Assuming n for the number of nodes and m for the number of bounded node,
finding the minimum takes O(log n) and traversing to right bound takes O(m) times,
so total time consumption is O(log n + m).
It can traverse a node out of bound, but the case like that is miscellaneous,
so we can ignore that.

=#
