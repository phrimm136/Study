#=

Q.

We have constructed Huffman trees based on the frequencies f_i of the members of Σ in the text w. For each character c_i of Σ, define the probability p_i of c_i as p_i - c_i/|w|.
(Since frequencies and probabilities differ only by the constant factor 1/|w|, the Huffman algorithm can use either when constructing the encoding tree.)
Let T be a Huffman encoding tree for w. Recall that the Fibonacci sequence is defined by F_0 = 0, F_1 = 1, and F_n = F_(n-1) + F_(n-2) for n > 1.

a. Show that if n is positive and p_i >= 1/F_(n+1), then the depth of c_i in T must be less than n.

b. Suppose conversely that p_i is known to be less than 1/F(n+1). What can be concluded about the depth of c_i in T?

A.

a.

|w| = F_(n+1), then we can produce Huffman tree
   F_(n+1)
      +---------+
     F_n       f_(n-1)
 +----+----+    +-------+
F_(n-1) F_(n-2) f_(n-2) f_(n-3)
...
F_0 can't be here because its value is 0.
Because F_2 = 1 and F_0 + F_1 = F_1 = F_2 = 1, it ends at F_2, whose depth is n+1-2 = n-1.
Thus, if p_i >= 1/F_(n+1) (n is positive), d_i is less than n.

b.

If p_i is less than 1/F(n+1), which is 1/(c*F(n+1)) (c > 1), then d_1 is c(n-1), which is larger than n-1.

=#
