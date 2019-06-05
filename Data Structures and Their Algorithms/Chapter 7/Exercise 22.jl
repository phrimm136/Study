#=

Q.

It was suggested that at least when data records are held in external
storage, it is better to keep all the data records in the leaves of a
B-tree, and to use the interior nodes of the tree strictly as an index to
help find the appropriate laf page. Donald Dumb favors using only
one node format and keeping data in the interior nodes as well. He
argues that by storing data records in the upper levels of the tree, some
of them will be found quickly, and this effect will compensate for the
fact that it might take more page accesses to reach those data that are
stored lower in the tree. What do you think of Donald's argument?
Analyze the situation on the assumption that an index entry takes 10
bytes and a data record takes 100 bytes, pages are 2000 bytes, nodes
are organized internally as balanced binary trees and searching for an
item within a node takes 100 ns per tree edge, and reading in a new
page takes 100 ms. Does Donald's view of the world make sense for
these or any other values of these parameters?

A.

With the conditions above, Donald's version would be better than the normal one
when finding a key in the node whose depth is 1 and the total depth is more than 1000.
In other cases, which means that we want to find a key whose depth is more than 1,
Donald's version would be terribly slower more wasting memory than the normal one.
Despite  any conditions given, if a new page takes more times and spaces (and it should be) than a new node takes,
it would still be a trash.

=#
