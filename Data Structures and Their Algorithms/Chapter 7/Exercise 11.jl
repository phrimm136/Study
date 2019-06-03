#=

Q.

Show that AVL trees can be used to provide an implementation of an
abstract data type "list" with the following operations. Each operation
should take time O(log |L|). (Hint: Store in each node the number of
items in the left subtree of that node.)

a. Access(L, i): Return the i-th element of L.

b. Insert(x, L, i): Return the result of inserting x after the ith element
of L.

c. Length(L): Return |L|.

d. Delete(L, i): Return the result of deleting the i-th element of L,
thus shortening L by one element.

A.

The list will be constructed like

2   3
7---10
|   |
0   1   
1-0 9-0
  4 | 15
    0
    8.

a.

If i is larger than number of items of a node, subtract it from i and access the next node.
If not, access access the sub-list of the node and repeat the these two statements.
By doing these, it takes time O(log |L|).

b.

Find a place like Access. If the nodes are exhausted before i, return false.
Else, push x after the place and return true. If needed, do rotation.

c.

Iterating the list, sum the number of items of each node.

d.

Find a place like Access. If the nodes are exhausted before i, return false.
Else, pop the node of the place and return true. If needed, do rotation.

=#
