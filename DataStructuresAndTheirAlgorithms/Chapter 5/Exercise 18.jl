#=

Q.

By definition, the leaves of an encoding tree must contain distinct characters.
Show that nothing is lost by this requirement in the sense that if T is an "encoding tree" with duplicate characters in its leaves, then there is always an encoding tree T' for the same alphabet without duplications such that, for any string w, the encoding of w using T' is no larger than the encoding of w using T.

A.

If duplicate characters in T has same depth, fork T` from T and make it to have no duplicate characters(D) by changing place to make them siblings and merging them to make their parent D, decreasing depth of D; encoding of w with T` is shorter than or equal to (no D in w) that with T.
If duplicate characters in T has different depth, fork T` from T and make it to have the swallowest one of duplicate characters(D) by deleting all of D except the swallowest one and merge sole leaves (Exercise 17), decreasing depth of some leaves; encoding of w with T` is shorter than or equal to (no characters with decreased depth) that with T.
Thus, encoding with T` is always not larger than or equal to that with T.
