#=

Q.

a. Show the results of inserting the keys 1, 2, ..., 10 in ascending
order into an AVL tree.

b. Show that if an AVL tree is constructed by inserting the keys 1,
2, ... , n in ascending order, then for some d all leaves in the
resulting tree have depth d or d + 1.

A.

a.

            4
      2            8
   1     3     6       9
             5   7       10

b.

Use induction.
When n=1, its depth is 0, true.
Assuming the statement is true when n=k, insert k+1 key in the tree.
Because the keys are ascending order, it is always inserted to the rightchild of the rightest node.
If all leaves have same depth d, k+1 has d+1 depth, true.
Else then some nodes from the right have d+1 depth.
After inserting, k+1 has d+2 depth, so there must be a node whose balance is 2.
(Its left child is a leaf with d depth and the right descendant is k+1.)
So rotation occurs and decreses the depth of k+1 to d+1. True.

=#
