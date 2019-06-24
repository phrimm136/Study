#=

Q.

Explain how to implement the operation Prefix defined in Problem 15
if sets are represented by splay trees. If this operation is added to the
repertoire, isit still true that any sequence of m operations involving
at most n items takes time O(m log n)?

A.

Splay for x and drop all nodes on right of the root.
Although splaying takes logarithmic time, dropping postfix nodes takes linear time on average, so it breaks assumption above.

=#
