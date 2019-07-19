#=

Q.

Suppose that a balanced dictionary tree is used in conjunction with a
leftist tree to implement dictionary operations as well as priority queue
operations. There is a problem with the suggested implementation
of Delete, since deleting a node in the leftist tree seems to require
knowing the location, not of the node, but of its parent. Suggest how
this difficulty might be overcome (there is more than one acceptable
method).

A.

Instead of deleting the node, substitute it with its child whose distance
is less, substitute the child with the grandchild, and so on until
the the node is replaced to the external node. Then delete the index of the
target from the balanced tree.

=#
