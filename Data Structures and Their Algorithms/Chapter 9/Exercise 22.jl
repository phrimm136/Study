#=

Q.

Where in the proof of the Theorem on Range Search in Search Trees
is the assumption used that the tree contains at least one element of the
range? What can be done if we do not wish to make this assumption?

A.

'Therefore Key(L_c) is in the range, since the search from L_c = R_c
extends to both its left child and is right child.'
If there is no elements in range, Key(L_c) is not in range.

Without this assumption, we can figure whether there are elements in range
by evaluating L <= key(L_c) <= U.

=#
