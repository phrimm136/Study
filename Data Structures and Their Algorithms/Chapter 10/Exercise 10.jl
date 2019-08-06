#=

Q.

Consider a heap M[O..N-1] containing diverse-sized blocks each
of which has a Size field, with no free space intervening between
the blocks (so, for example, the second block begins at M[Size(0)]).
The heap may be full, or there may be free space at its end. Suppose
now that each block also has a NewSize field, and that we wish to
change the size of each block (by either expansion or contraction)
under the assumption that all useful information within a block is at
its beginning. That is, if Size(B) = j and NewSize(B) = k < j,
then the first k words of block B are important and must be preserved,
while the final j - k words can be forgotten; and if k > j then we
don't care about the contents of the final k - j words of the expanded
block. Devise an algorithm that restructures the heap, resizing each
block as required, without using any additional storage. You may
assume that there are no pointers to blocks (so that blocks can be
moved without worrying about dangling pointers) and that the sum
of the NewSize fields is at most N. When your algorithm finishes,
the heap should once again consist of contiguous blocks with all free
space (if any) at the end of the heap. Of course, the Size fields should
be updated to their new values!

A.

=#

function reconstruct(M)
    # assume that addresses of first and last cell is given.
    cur_heap = M
    lazy_move = []
    while cur_heap < M+N+1
        size = cur_heap["size"]
        new_size = cur_heap["new_size"]
        if size > new_size
            move(cur_heap + size, M+N, new_size - size)
            # move function moves blocks from the address of the first argument
            # to the address of the second one by size of word * the third argument.
            cur_heap["size"] = new_size
            cur_heap += new_size
        else # expanding case is evaluated later; exceeding border
            add_list(lazy_move, [cur_heap, new_size])
            cur_heap += size
        end
    end
    while cur_heap, new_size in lazy_move
        size = cur_heap["size"]
        move(cur_heap + size, M+N, new_size - size)
    end
end
