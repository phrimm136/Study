#=

Q.

In Lempel-Ziv encoding the input string is considered one character at a time as we search for the longest match. This process ends when we encounter the first character such that the string-so-far is not in the dictionary. At that point, we have in our hands the string that will be added to the dictionary in the next step, and might as well add it immediately.
For example, consider again the text COCOA AND BANANAS. In the first step, we would match C, fail to match CO, and thus output #(C) and add CO to the dictionary. In the second step, we match O, fail to match OC, and so output #(O) and add OC to the dictionary.

a. Show how Figure 5.9 on page 152 would be constructed by this variation of the encoding algorithm.
Warning: it is not sufficient to advance each entry in the "Add to Dictionary" column!

b. With this variation of the algorithm, it is possible that LookUps by the decoder might fail! Show how this occurs in the example, and explain clearly how the decoder should proceed to resolve the problem correctly.

c. Compare this version of Lempel-Ziv encoding with that described in the text. How much difference can there be in the size of the encoding of a text of length n?

A.

a.

Step     Output     Add to Dictionary
1        #(C)       CO
2        #(O)       OC
3        #(CO)      COA
4        #(A)       A□
5        #( )        A
6        #(A)       AN
7        #(N)       ND
8        #(D)       D□
9        #( )        B
10       #(B)       BA
11       #(AN)      ANA
12       #(ANA)     ANAS
13       #(S)       -

b.

When decoding, although all bitstream is exhausted, it still attempts to configure whether the string-so-far is in the dictionary, then we get an error (empty string).
We should handle the last case that bitstream is empty to stop further searching.

c.

Diff: (Number of string-so-far which is mathing right after) * (size of encoded strings)

=#
