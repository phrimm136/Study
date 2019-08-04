#=

Q.

Suppose that memory is allocated in blocks of varying size and that
blocks are not linked (so that it is unnecessary to worry about pointers
to blocks). Suppose further that blocks are allocated and explicitly
freed in strict first-in-first-out fashion, that is, no block is freed until
after all previously allocated blocks have been freed. Design and code
routines FIFOAllocate and FIFOFree in such a way that all requests
can be satisfied, provided only that at any time the total size of the
allocated blocks is less than or equal to the size of the heap.

A.

=#

function FIFO_allocate(size)
    if cur_heap + size < last_heap
        allocated = cur_heap
        allocated["size"] = size
        cur_heap += size
        return cur_heap
    else
        if reserved_size + size > max_size
            allocated = front_heap
            allocated["size"] = size
            cur_heap = front_heap + size
            return cur_heap
        else
            return 0
        end
    end
end

function FIFO_free(P)
    size = P["size"]
    if cur_heap == P
        cur_heap += size
    else
        if cur_heap + size > last_heap
            cur_heap = front_heap
            if cur_heap == P
                cur_heap += size
            end
        end
    end
end
