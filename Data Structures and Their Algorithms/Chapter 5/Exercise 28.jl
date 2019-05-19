#=

Q.

Suppose c_1 and c_2 are two characters of frequencies f_1 and f_2 in text w, and let d_1 and d_2 be the depths of c_1 and c_2 in a Huffman encoding tree for w.

a. Show that f_1 > f_2 implies d_1 <= d_2

b. Show that f_1 = f_2 implies |d_1 - d_2| <= 1.

A.

a.

If a node c_k made from c_1 and its sibling has same frequency as f_2, then there are two cases that c_k and c_2 form a node or c_k forms a node with a node with higher frequency than f_n.
In first case, c_1 is always lower than c_2 as 1. d_1 < d_2, equation holds.
In second case, the parent of c_2 has possibility to be sibling with the parent of c_1. So d_1 <= d_2, equation holds.
If f_n is larger than f_2(which means that there are no other node whose frequency is between f_1 and the frequncy of its sibling.), d_1 < d_2 (nth ancestor of c_k and c_2 are siblings) or d_1 = d_2 (nth ancestor of c_k and a node with a parent of c_2 are same).
If f_n is smaller than f_2, then d_1 < d_2, obviously.
Thus, if f_1 > f_2 then d_1 <= d_2.

b.

If a node c_k made from c_1 and its sibling or c_2 and its sibling, |d_1 - d_2| = 1 (nth ancestor of c_k and one of c_2 or c_1 are siblings) or |d_1 - d_2| = 0 (the nth ancestor of them are siblings), so |d_1 - d_2| < 1.
If a node c_k made from c_1 and c_2 then |d_1 - d_2| = 0, obviously.
Thus, if f_1 = f_2 then |d_1 - d_2| <= 1.
