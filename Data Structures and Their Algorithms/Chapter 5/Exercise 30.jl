#=

Q.

Determine the worst-case performance of Huffman encoding; that is, find the maximum possible size in bits of the Huffman encoding of a string w over an alphabet Σ, in terms of Length(w) and |Σ|.

A.

If all encoding size except the largest two (Huffman tree is full tree.) is different, Huffman encoding performs worst.
The maximum bit size of the Huffman encoding of a string w over an alphabet Σ is Lenth(w) * |Σ| / 2 + (the least number of an element) - 2.
