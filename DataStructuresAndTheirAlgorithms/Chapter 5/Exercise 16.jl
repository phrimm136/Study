#=

Q.

Prove the assertion on page 145, that unique decodability is assured if no character's encoding is the prefix of another character's encoding.
Is the converse true? That is, given an alphabet and a bit sequence encoding each character, with the property that the encoded version of any string can be unambiguously decoded, does it follow that no character's encoding is the prefix of another character's encoding?

A.

Assume that a character's encoding S_1 contains another character's encoding S_2.
If S_2 is not the prefix of S_1, we can read and delete fore bits from S_1 to make S_2 be the prefix of S_1.
However, the bits read from S_1 distinguishes continuing character decoding from starting character decoding, so if no character's encoding is the prefix of another character's encoding unique decodability is assured.

Assume S_1 and S_2 again. If S_2 is prefix of S_1, then there is the rest part of S_1. However, because encoding tree is always full(Exercise 17), so there should always be a encoded character starts with it. So we cannot distinguish S_1 from S_2, and the inverse is true.

=#
