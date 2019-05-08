#=

Q.

Our discussion of the Huffman algorithm has assumed that encoded text is represented by a sequence of bits.
Generalize this assumption: suppose that the encoded text is represented by a sequence of characters from an arbitrary alphabet Σ which has more than two characters.
Describe the generalized version of the Huffman tree-construction, encoding, and decoding algorithms, and state and prove the generalized optimality theorem.

A.

Choose n-characters from Σ, then Huffman tree is a tree that has n children.
For encoding, choose the smallest n nodes and make a n-children subtree until there is exactly n nodes.
For decoding, read encoding string and move to the child whose edge is equal to the current encoding character.
Generalize lemma on page 148, for T' which has all nodes except c_1, c_2, ... , c_n in T and c_(n+1), and WPL(c_1) + WPL(c_2) + ... + WPL(c_n) = WPL(c_(n+1)),
if n characters are siblings, then WPL(T') = WPL(T) - WPL(c_(n+1)),
else if n characters are not siblings but in the same depth, then WPL(T') = WPL(T) - WPL(c_(n+1)),
else if n characters has different depth, then WPL(T') <= WPL(T) - WPL(c_(n+1)),
so WPL(T') <= WPL(T) - WPL(c_(n+1)).
Thus, assuming X as an encoding tree whose leaves are same as T, WPL(T) <= WPL(X) on n encoding characters.

=#
