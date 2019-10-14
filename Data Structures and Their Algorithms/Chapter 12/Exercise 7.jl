#=

Q.

Complete the proof of the Tree Characterization Theorem (both parts).

A.

part 1

a.

Due to recursive procedure, all verteces are connected.

b.

Each node should be connected with its parent and children
and those are distinct, T is acyclic.

d.

e = {u, v} ∉ T means that the nodes are not in parent-child relationship
but have common ancestor, which means that there is a unique path between the nodes.
So adding e means direct connection between them, and since there are now two paths
we have cycle that e is part of it.

e.

Use induction.
If there are two nodes, there is an edge, axiomly.
Assuming that with k nodes there are k-1 edges.
Since a new node can only have connection with its parent,
with k+1 nodes there are k edges.
Thus this property is true.

part 2

a.

Since there should be n-1 edges in G, G is connected
and acyclic following lemma a and b.

b.

If deleting any edge doesn't yield disconnected graph,
G is cyclic, which is contrary to the lemma a.
(b is an alias of a.)

c.

If G is complete, then the number of edge will exceed n-1.
If adding an edge yields a graph with more than one simple cycle,
it is already cycle and has more than n-1 edges.

=#
