#=

Q.

For each integer n > 0, let W_n be the string consisting of n character As, followed by a single character B, followed by n more As. For example, W_3 = AAABAAA and w_0 = B.

a. What is the length in bits of the Huffman encoding of W_n?

b. What is the length in bits of the Lempel-Ziv encoding of W_n, under the assumption that each code number has k bits and that the dictionary never overflows?

c. What is the largest value of n such that the assumption in part (b) (that the dictionary does not overflow) is valid?

A.

a.

2n bits

b.

k * ((sigma i from 1 to m i) + 2 (leftover As after sigma on the left + B) + ceil(n/m) (As on the right))

c.

n = (sigma i from 1 to 2^k-1 i)
