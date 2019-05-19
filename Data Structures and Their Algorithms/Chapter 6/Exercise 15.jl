#=

Q.

Prove by induction on the number of internal nodes that E = I + 2n for any extended binary tree with n nodes, where E is the external path length and I is the internal path length.

A.

If n = 1, two external nodes append length one, respectively. So the equation holds.
If we assume that at n = k the equation holds, then at n = k+1 there are new two external nodes appended to a two internal node. Since an external node is replaced by the new internal node and the two external ones appended to it, E_(n+1) ((n+1)th E) = I_n + d_(n+1) + 2n + 2 = I_(n+1) + 2(n+1), the equation holds.
Thus E = I + 2n.

=#
