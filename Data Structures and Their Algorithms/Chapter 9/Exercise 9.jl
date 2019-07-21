#=

Q.

A priority queue is said to be stable if deletions of items with equal
priority value occur in the order in which they were inserted. Which
of the priority queue structures discussed in this section are stable?
Explain why, or give counterexamples.

A.

Assume that we insert nodes with same priority alue into a heap.
After deleting the root, the last node will become the root and
drop to its position. But with implementation in the book, it will
stop when the priority of the tis children is equal to it.
Thus, it will remain at the root, breaking stability.

Leftist tree is also not stable, because swapping can mess up the order.

    5                     5
   / \                   / \
  5   5         =>      5   5
     / \               / \
    5   5             5   5

Priority queue in exercise 8 inserts later nodes with redundant priority
into the leaves and delete nodes in inorder. It is not stable, either.

=#
