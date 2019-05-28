#=

Q.

Explain carefully why no sequence of single and double rotations of
a binary tree changes the result of an inorder traversal of the tree.

A.

Let a tree fragment
    A
  /   \
 T`    B
     /   \
    T``   T```,
A and B are nodes, and T`, T``, and T``` are subtrees. T``` is deeper than T``.(RR case)
After single rotation, it becomes
      B
    /   \
   A     T```
 /   \     
T`    T``.
The inorder is same as ascending order, since it traverse the lower children of node, node, and the larger children of node.
With this property, T`` can be the right child of A or the left child of B without changing the result of the inorder traversal.
Rotating among most-ouside nodes (A, b, T`, and T```) don't changes the result of the inorder traversal,
thus the single rotations of a binary tree don't change the result of an inorder traversal of the tree.
The LL case is symmetric of RR case.

Since double rotation is constituded with two single rotations,
it also don't change the result of an inorder traversal of the tree.

=#
