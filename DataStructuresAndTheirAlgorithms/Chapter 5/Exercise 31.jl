#=

Q.

Suppose that T is any binary encoding tree for a string w and assume that each leaf of T represents a character that occurs at least once in w.
As usual, for each node n of T let C(n) be the weight of n: the weight of each leaf is the frequency of occurrence of its character in w, and the weight of each nonleaf is the sum of the weights of its children.

a. Show that T is an optimal encoding tree for w if and only if it satisfies the following condition: there is an ordering n_1, n_2, ... , n_(2|w|-1) of the nodes of T such that l(n_i) <= l(n_(i+l)) for each i, and moreover each adjacent pair of nodes n_(2k-1), n_(2k) are siblings in T.

b. Let T be an optimal encoding tree for w, let an ordering of the nodes of T be given as in part (a), and let n_i be any leaf of T. Suppose that n_i < n_(i+1), and moreover suppose that n_(i') < n_(i'+1) for every ancestor n_(i') of n_i. Show that T is an optimal encoding tree for the string Concat(w, c), where c is the character represented by n_i.

(These results are the crucial facts used in an efficient implementation
of the adaptive Huffman encoding algorithm-see page 484.)

A.

a.

If n_1, n_2, ..., n_(2|w|-1) meet given conditions, according to the lemma on page 148, T is an optimal encoding tree for w.

b.

After concatenation, n_i <= n_(i+1) and n_(i') <= n_(i'+1).
It still meet given conditions on part (a), so T is an optimal encoing tree for the string Concat(w, c).

=#
