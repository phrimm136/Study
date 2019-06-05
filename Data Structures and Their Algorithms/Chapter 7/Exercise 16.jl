#=

Q.

a. Repeat Problem 11 for 2-3 trees.

b. Show that the operations Concat(L1, L2) and Initial(L, i) (which
returns a sublist consisting of the first i elements of L) can also
be implemented in logarithmic time.

A.

a.

Each node stores the number of items in the left and middle children.
In Access, Insert and Delete, read the number of two left children of each node and there are some branches.
If the sum of those numbers and previous ones are less than i, proceed to the next node(right child).
If the sum of those numbers and previous ones are equal to i, the right key is in the position i.
If the sum of the those numbers and previous ones are larger than i but sum of the left and previous ones are less than i,
proceed to the middle child. 
If the sum of the left key and previous ones are equal to i, the left key is in the position i.
If the sum of the left key and previous ones are larger than i, proceed to the left child.
For Length, simply sum all numbers stored in each node and the number of the list node.

b.

