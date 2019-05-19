#=

Q.

Notwithstanding Problem 21(a), the trees produced by the Huffman algorithm may differ when different tiebreaking schemes are used. In particular, for a given text there may be Huffman trees of different
heights. 
(For example, the string ABCCDD has Huffman trees of heights 2 and 3.)
Find a tiebreaking scheme for the Huffman algorithm such that the resulting tree has minimum height among all possible Huffman trees for the given text.

A.

Make a priority-queue, return a character among characters with same priority when it is enqueued.
Make a node with characters first rather than sub-tree.

=#
