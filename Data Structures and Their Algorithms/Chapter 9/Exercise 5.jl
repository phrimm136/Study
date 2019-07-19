#=

Q.

Heaps permit one to find the minimum element in constant time and to
insert or delete an element in O(log n) time. Explain how to modify
the heap data structure and algorithms to provide an implementation
of a double-ended priority queue with the following characteristics:
the data structure can be constructed in 0(n) time, a record can be
inserted or deleted in 0(logn) time, and either the minimum or the
maximum can be found in constant time. (Hint: Arrange the records
so that each node at even depth has key value greater than that of
any of its descendants, and each node at odd depth has key value less
than that of any of its descendants. This data structure is called a
min-max heap.)

A.

In a new heap, the elements at even row are greater than their descendants,
and those at odd row are less than their descendants.
When we insert a new element in the new heap, there are two cases.
When it is in even row, compare it with its parent and grandparent.
If the parent is greater than it, swap them and transfer control to the odd case.
Else if the grandparent is less than it, swap them and repeat the procedure with the grandparent.
The odd case is symetric of the even case.
Iterate these procedures until the conditions are false or the element becomes the root.
After some insertions, the greatest element will be root and the
least element will be the less child of the root.
When deleting the maximum element, swap it for the last element and delete the last.
When even case, if the element is less than any of its children, swap it for the greatest child
and transfer control to the odd case.
Else if the element is greater than any of tis grandchildren, swap it for the least grandchild
and repeat the procedure with it.
The odd case is symetric of the odd case.
The ordering algorithm in delete function is same as one of the construct function.
By applying it to each element of the heap, we can construct min-max heap.

Since comparision and swap takes constant time, with these comparison procedures,
insertion and deletion is conducted in O(log n) time, construction in O(n) time.
Also, now we know that the maximum element is the root and the minimum element is
the less one of the children of root, it can be retrieved in constant time.

=#
