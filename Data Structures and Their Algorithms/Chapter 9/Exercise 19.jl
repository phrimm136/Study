#=

Q.

Carry out a range search of the tree in Figure 9.10 on page 318 for
the range from O to W. What are the left and right bounding paths
for this search?

A.

Find left bounding path.
F is less than O, so the right subtree is processed.
At S, it is greater than O, so the left subtree is processed.
At N, it is less than O, so the right subtree is processed.
At Q, it is greater than O, so the left subtree should be
processed but is empty, so the right one is processed.
At R, it is leaf so there is the end of the left path.

Find right bounding path.
F is less than W, so the right subtree is processed.
At S, it is less than W, so the right subtree is processed.
At V, it is less than V, so the right subtree is processed.
At Y, it is leaf so there is the end of the right path.

Left bounding path: F S N Q R
Right bounding path: F S V Y

=#
