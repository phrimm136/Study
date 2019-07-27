#=

Q.

Suppose that the specification of the range searching operation is
redefined so that, instead of performing Op on all items in the range,
it returns as a value the set of all items in the range. Show that by
using a search tree representation, range searching in this sense can be
performed in one dimension in time O(log n), where n is the number
of items in the set being searched, independent of the number of items
in the range. Show that this worst-case logarithmic time bound can
be maintained even if points are dynamically inserted into and deleted
from the data structure.

A.

Setting L_c as a root and deleting elements out of range on search paths,
we can get sub-tree in given range in O(log n) time.

=#
