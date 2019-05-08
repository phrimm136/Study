#=

Q.

By definition, every encoding tree is full; that is, each nonleaf has exactly two children.
Show that nothing is lost by this requirement in the sense that if T is an "encoding tree" that is not full, then there is always a full encoding tree T' for the same alphabet such that, for any string w, the encoding of w using T' is no larger than the encoding of w using T.

A.

If sole leaves in T has same depth, T` merges them to make full; there is depth decrement where a sole node is deleted to make siblings, two encoding of w has same length.
If sole leaves in T has different depth, move deeper leaf to be sibling of another sole leaf; depth of moved leaf decreases, encoding of w with T` is shorter than or equal to (no character moved in tree) that with T.
If sole leaf is in T, move it to its parent; depth-1, encoding of w with T` is shorter than or equal to (no character moved in tree) that with T.
Thus, encoding with T` is always not larger than or equal to that with T.

=#
