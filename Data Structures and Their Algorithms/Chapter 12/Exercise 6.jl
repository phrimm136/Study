#=

Q.

Suppose the recursive procedure for constructing trees described on
page 98 is modified to construct undirected graphs; that is, instead
of adding edges <r,r_l>, <r,r_2>, and so forth, we add edges {r,r_1},
{r, r_2} and so forth. Show that the object constructed by the re-
cursive procedure is a tree according to the definition on page 430.
Conversely, show that any tree can be constructed by the recursive
procedure, with any vertex at the root.

A.

Since all noes could only be accessed from the root, trees have unique paths.
Also, due to limited connectivity that each node only can make connection with
newly inserted child, they have simple paths.
Thus, even undirected graphs can construct trees.

=#
