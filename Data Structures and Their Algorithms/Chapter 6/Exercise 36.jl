#=

Q.

Show that a binary search tree can be reconstructed from its postorder
traversal. That is, show that if the key sequence K_1, ..., K_n is the
postorder traversal of a binary search tree, then the structure of the
tree is uniquely determined from this sequence and in fact can be
determined as the sequence is read from left to right. Does the same
hold for the preorder traversal? What about the inorder traversal?

A.

If the key sequence is the postorder traversal of a binary search tree,
its construction is (low keys ... high keys ... a middle key).
Until we read a middle key, we construct a left-skewed tree(a tree with only left child).
When we read a middle key, we split the skewed tree into two sub-trees based on the middle key and make them children of it.
Becaue the keys except the middle key is sorted in ascending order,
putting the middle key into the n key sequence yields n+1 unique trees, thus the statement is true.


It would be true for preorder and inorder traversal, but I don't want to prove it now...
