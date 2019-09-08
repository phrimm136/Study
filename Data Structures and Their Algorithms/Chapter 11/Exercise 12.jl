#=

Q.

In Algorithm 11.4, the procedure InitializeHeap does somewhat more
work than is really necessary. What simple change will make this
procedure more efficient?

A.

Add if statement that check whether a node is less than its children.
It will prevent the procedure from heapifying sub-heap ordered at
previous iterations.

=#
