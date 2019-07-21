#=

Q.

Show that Ω(m log n) is a lower bound on the time to perform m op-
erations on n elements if up-trees are used with balancing but without
path compression. That is, exhibit a sequence of m operations that
will require Ω(m log n) time.

A.

Like worst AVL tree, set worst balanced up-tree.
Then every node will be leaf, whose min path length is floor(log n).
So the lower time bound of m operations is Ω(m log n).

=#
