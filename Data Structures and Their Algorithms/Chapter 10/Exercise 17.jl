#=

Q.

Explain carefully how to implement the best fit strategy using a binary
tree implementation of the pool.

A.

At start, there is only root, which points front of the pool and
whose value is the whole block number.
When allocation occurs, search the leftest node whose value is
larger than or equal to requested size, move its pointer and
reduce value by requested size.
When deallocation occurs, first search a pointer next to the
deallocated blocks to concatenate them. If finded, sum those
values and assign the pointer to the one of deallocated blocks.
Otherwise, search appropriate place for the blocks and assign it.
When placing, if block sizes of the nodes are equal, than compare
those pointer, so the node with less pointer becomes 'lefter'.
By doing like this, we can allocate blocks from left side.

=#
