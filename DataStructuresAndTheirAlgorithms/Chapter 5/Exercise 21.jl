#=

Q.

a. Show that tiebreaking is not significant in the Huffman algorithm in the sense that the total size of the encoded text is the same regardless of how the tree construction algorithm breaks ties when
selecting nodes of minimum weight.

b. Give a proof or counterexample of the following converse of the Huffman Optimality Theorem on page 149. Let T be any encoding tree for text w such that WPL(T) is a minimum over all encoding trees for w. Then there is some way of breaking ties in the Huffman algorithm such that T is constructed.

A.

a.

Even if we make algorithm break ties (= choose elements with an order in ties) differently, it always produces the tree with same WPL (place of elements may be differ.) because when we always choose a node with the smallest weight the resulting weight is also same.

b.

 - If WPL(T) <= WPL(X), is it true that T and X have same leaves?
Because T and X is encoding trees of the same text, X can't have more leaves than T.
Let T be any encoding tree for text w such that WPL(T) is a minimum over all encoding trees for w.
