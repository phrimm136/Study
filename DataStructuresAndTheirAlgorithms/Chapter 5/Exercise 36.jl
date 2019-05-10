#=

Q.

Suppose that Σ = {A, B} and that w is a string of length n over Σ containing at least one of each character.

a. If Huffman encoding is used, what are the smallest and largest possible sizes (in bits) of the compressed representation of w?

b. If Lempel-Ziv encoding is used, what are the smallest and largest possible sizes (in code numbers) of the compressed representation of w? (Assume that the dictionary never overflows.)

A.

a.

Smallest: |w| bits (only one character) / Largest: 2|w| bits (two characters)

b.

Smallest: round(sqrt(2|w|)) bits (only one character) / Largest: 2|w| bits (characters are alternating)

=#
