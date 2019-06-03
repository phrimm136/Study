#=

Q.

Show that any n-node binary tree can be converted into any other by
means of at most 2n single rotations. (Hint: Show that it takes only
n rotations to covert any binary tree into the tree in which all left
children are empty.)

A.

Moving all elements of left-skewed tree (the right subtree is empty) to right subtree takes n single rotations,
which is list-like tree.
So any tree attempting to convert into skewed tree takes at most n single rotations.
If we balance the right-subtree, it also takes n single rotations.
So shaping the skewed tree takes at most n single rotations.
Thus, any tree can be converted into any other with at most 2n single rotations.

=#
