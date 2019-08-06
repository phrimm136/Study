#=

Q.

Assume that allocation and deallocation requests cannot be predicted
in advance and that blocks cannot be moved within the heap once
they have been allocated. Show that any memory allocation algo-
rithm is inferior to clairvoyance; that is, show that any algorithm that
dynamically allocates blocks by responding to requests as they occur
will fail to satisfy some sequence of requests that could be satisfied
if the whole sequence were known in advance. (An algorithm must
always respond to the same sequence of requests in the same way.)

A.

In ten blocks,

Alloc(A, 4)
Alloc(B, 4)
Free(A)
Alloc(C, 3)
Alloc(D, 3) => fails.

If we know these sequnces in advance, allocate B at the last of heap
and following allocations will be succeeded.

=#
