#=

Q.

The degree of a vertex of a graph is the number of its neighbors. A
leaf of a tree is a vertex with degree one.

a. Find all trees with no leaves, with exactly one leaf, with exactly
two leaves, and with exactly three leaves.

b. Find a formula for the number of leaves of a tree in terms of the
number of vertices in the tree and the degrees of the vertices.

A.

a.

no leaves: Only a root exists.

one leaf: Impossible. Even with two vertices there are more than two leaves.

two leaf:
  a            a            a             a
 / \          / \          / \           / \
b   c        b   c        b   c         b   c
            /            /     \       /     \    ...
           d            d       f     d       f
                                     /
                                    g

three leaf:
         a             a            a
        / \           / \          / \
       b   c         b   c        b   c
      / \   \       /     \      / \   \   ...
     d   f   g     d       f    d   f   g
                  / \          /   /
                 g   h        h   i

b.

(degrees of vertices except leaves) - 2(number of vertices except leaved)

=#
