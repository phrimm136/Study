#=

Q.

A p-tree is a binary tree structure used to implement priority queues.
1. Any node lacking a left child also lacks a right child.
2. The priority value of any node is greater than or equal to that of
its left child (if it has a left child).
3. All priority values in the right subtree of a node P are less than
the priority value of P itself, and are greater than or equal to the
priority value of P's left child.

a. Where are the maximum and minimum items in the entire tree?

b. Show that priority trees can be used to implement priority queues
by giving implementations of Insert and DeleteMin. It may be
helpful to augment the trees with pointer fields in addition to the
left and right child pointers.

c. Show that the algorithms of part (b) can be implemented so that
the priority queue is stable, in the sense of Problem 9.

d. Show that p-trees can also support DeleteMax, thus providing an
implementation of double-ended priority queues.

e. Show that after a sequence of n insertions in a p-tree (with no
deletions), the length of the path from the root through left chil-
dren to a leaf is about 2 ln n.

A.

a.

The maximum item is the root since it is larger than its right descendants
and larger than or equal to its left child..
The minimum item is the leftist node, since right descendants of a node is
larger than or equal to its left child and the right child can't occur solely.

b.

In inserting N, at the root R:
if R is null or N is greater than R, R is the left child of N which becomes the root;
otherwise search down the tree to find a node P that P < N.
In iteration:
if the left child of P is null, N becomes the left child of P;
if the left child of P <= N < P, insert N the right subtree of P.

In deleting min(M):
if M is a leaf, just delete it and move its sibling to its position;
else its left child takes its position if right one is empty,
otherwise its right child does.
The deletion selects the first one equal to the given priority.

c.

Since inserting nodes with redundanting priority forms a left-skewed
list-like branch without right child, where the earlier one has less depth.
Since nodes with less depth takes priority for deletion, it is ensured that
nodes inserted earlier is deleted earlier.
Therefore, p-tree is stable priority queue.

d.

Delete the root which has the maximum value, and make its right child(if it exists)
or the counterpart(otherwise) to take its position.

e.


