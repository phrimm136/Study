#=

Q.

Devise a priority queue representation that permits each FindMin and
DeleteMin operation to run in constant time, while Insert takes time
0(log n). (Hint: Keep the records both in a list and in an AVL tree.
When deleting an item, remove it completely from the list, but leave
it in the AVL tree, with its priority changed to -1. Remove nodes
from the AVL tree only when the root acquires priority -1.)

A.

Insert new node into the doubly linked list, whose position is
in front of the its inorder successor, and insert it and its address
to the AVL tree which is in ascending order of the priority.
If the new is the leftiest except the node with -1 priority, save its address.
The time consumption is O(1) + O(log n) = O(log n).
When deleting the minimum node, delete it from the list, change saved address to
its inorder successor, and set its priority in the tree to -1.
If the priority of the root is set to -1, then GC initiates.
In GC, each deletion takes amortized O(1), so entire time cost is O(n).
Since it occurs when half of node is deleted in list, so the deletion takes
O(1) time in average.

=#
