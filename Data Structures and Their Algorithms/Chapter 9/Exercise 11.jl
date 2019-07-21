#=

Q.

A binomial tree of order n is an ordered tree consisting of a root B
with n children, such that the ith child of B is a binomial tree of
order i for each 0 <= i <= n-1 (Figure 9.18 depicts several binomial
trees). It is easy to see that any binomial tree of order n has exactly
2^n nodes. A binomial forest is a forest of binomial trees with no
two trees of the same order. There is only one way to construct a
binomial forest with k nodes for any given k: the forest will have
one tree for each 1 in the binary representation of k. A binomial
queue is a binomial forest in which each node stores a key value
(and possibly other information associated with the key) such that
each tree is partially ordered; that is, the key of each node is less than
the keys of its children.

a. Devise a representation for binomial trees that allows two trees
of order n to be combined into a single tree of order n + 1 in
constant time, preserving the tree partial ordering, and that allows
two binomial queues having n_1 and n_2 nodes respectively to be
combined into a queue with n = n_1 + n_2 nodes in time O(n log n),
thus implementing the abstract operation Union. (Hint: Consider
the usual addition algorithm for binary numbers.)

b. Show how to implement the Insert and DeleteMin abstract op-
erations on a binomial queue in time O(log n), where n is the
number of elements in the queue.

c. Show how to implement Delete(X, B), which deletes from a bi-
nomial tree an arbitrary node X (whose location is given) in time
logarithmic in the number of nodes.

d. Analyze the space requirements of your representation.

A.

a.

For union of two n order binomial tree, compare the priority of the
root of them and the tree with greater one bacomes the child of another one.
For union of two binomial queue, from a smaller one, union them.
If union occurs(carry) and there is binomial tree of the next order in each queue,
union them except carry. Otherwise, union a binomial tree of n+1 order (if exists)
and carry like binary addition.
Because number of tree of binomial heap is log n, union operation takes O(log n) time.

b.

Insert is same as making one order binomial heap of node to insert and conduct union,
taking O(log n) time.
DeleteMin is that find the smallest root in the heap, take it, break down the tree with it
into subtrees and union them with the original heap.
Searching through heap and union takes O(log n) time and spliting a tree is trivial, so the
time consumption is O(log n).

c.

Find the node (O(log n)) and decrease it to negative infinity. This will violate min heap property,
invoke reordering(O(log n).) Then, call DeleteMin(O(log n).)

d.

Let p_1 as pointer space to the next binomial tree, p_2 as pointer to the next node in the tree,
and v as value(keys and items, etc.), and n as the number of the nodes.
Then, space consumption is (p_1)*log n + (p_2 + v)n.

=#
