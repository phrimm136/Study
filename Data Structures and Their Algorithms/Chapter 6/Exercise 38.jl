#=

Q.

Consider the abstract operation Equal on sets and the abstract operation 
Subset, where Subset(S, T) returns true if set S is a subset
of set T and false otherwise. Explain how to implement these two
abstract operations for each of these data structures: unordered lists,
ordered lists, and binary search trees. (Try to avoid using a sequence
of LookUps.)

A.

I will make functions sort the lists, so it can handle both ordered/unordered lists.
In Equal, we will traverse S and T at the same time.
If an element of them are different or traversing only one list is done, it returns false.
If an element of them are equal, keep traversing.
If traversing both lists are done, it returns true.

In Subset, the strategy is similar, but it returns true when traversing S is done.
Also, if an element of T is smaller than one of S (not equal to) it returns false, else keep traversing.

We can implement the functions for 'balanced' binary search trees (it is easier to implement for it) like those for lists,
but they should be recursive at every branch of trees.
The functions balance binary search trees and traverse them.

=#
