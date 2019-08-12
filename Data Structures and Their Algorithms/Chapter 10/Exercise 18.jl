#=

Q.

It appears that Algorithm 10.8 on page 365 does a little more work
than is really needed when deallocating a block with exactly one free
neighbor; in that case it removes a block from the free list and then
inserts a block onto the free list, when it would suffice to change the
description of that block. Explore whether this idea is really feasible,
and worth the trouble.

A.

By doing like this, there would be a little more work, but we can
reduce cases by two. Deleting and inserting changes only the position of
the block, so it's feasible and worth the trouble.

=#
