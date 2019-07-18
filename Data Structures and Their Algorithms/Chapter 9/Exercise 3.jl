#=

Q.

Algorithm 9.1 on page 303 gives an implementation of HeapInsert
that takes time O(log n) in the worst case.

a. Show that the exact number of comparisons between data items
is about lg n in the worst case, and that the exact number of
movements of data items is also about lg n.

b. Show that the number of comparisons can be reduced to about
lg lg n by performing binary search, without changing the number
of movements of data items.

A.

a.

Since heap can be cnsidered as complete tree, and insertion and
deletion proceed with deepest and rightest element, the path
between root and the element is about lg n.
Also, comparison and movements is in proportion to the path,
so number of them is about lg n.

b.

Take ancestors of the last element, making array of them.
Then, conduct binary search to find the location to insert.
(binary search on lg n list => lg lg n)

=#
