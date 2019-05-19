#=

Q.

Prove that if an extended binary tree has 2^k-1 internal nodes, then the internal nodes form a perfect binary tree of height k-1.

A.

Use induction.
If k = 1, then a node makes a tree with 0 height, so the equation holds.
If we assume that when k = n the equation holds, at k = n+1 the tree takes new 2^n internal nodes, which is equal to the number of external nodes. replacing the external with the internal and attatch new external nodes to the new internal ones, 2^(n+1)-1 internal nodes make a perfect binary tree of height n. The equation holds.
So if an extended binary tree has 2^k-1 internal nodes, then the internal nodes form a perfect binary tree of height k-1.

=#
