#=

Q.

Show how a version of red-black trees can be used to implement
(2,4)-trees in such a way that insertions can be done while rebalancing
the tree "on the way down," thus not requiring the insertion path to
be retraced.

A.

Denote contents of each 5-node as (c_1 k_1 c_2 k_2 c_3 k_3 c_4).
Like normal RB-trees, keys are connected with red edges and also children with black ones.
If insertion makes 5-node, then split is conducted.
Split procedure rotates the node so that k_2 will be the child of its parent.
Then, k_1 and k_3 will be the children of k_3, whose children is (c_1, c_2) and (c_3, c_4), respectively.
We don't send a key to the parent of node to be split, so we don't need to trace the insertion path.
