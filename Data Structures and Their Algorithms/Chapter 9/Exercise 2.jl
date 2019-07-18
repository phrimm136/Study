#=

Q.

Show that deletion of an arbitrary element (not just the minimal ele-
ment) of a heap can be done in O(log n) time, if its index in the
heap is known. That is, give an O(log n) implementation of a routine
HeapDelete(i, h) that deletes the item with index i in the heap h.

A.

Considering the index i as the root of a sub-partial-tree,
we can conduct DeleteMins on it, which take O(log n) times.

=#

function HeapDelete(i, h)
    H = h.["table"]
    n = h.["size"]
    if n = 0
        error("Heap is empty")
    end
    I = H[i]["item"]

    partial_n = i
    while true
        if 2*partial_n > n
            break
        elseif 2*partial_n + 1 > n
            partial_n *= 2
            break
        else
            partail_n = 2*partial_n + 1
        end
    end
    # Finding partial n takes O(log n), which is separate from the loop below.
    K = H[partial_n]["key"]
    m = i
    while 2*m < partial_n && K > H[2*m]["key"] || 2*m+1 < partial_n && K > H[2*m+1]["key"]
        if 2*m+1 < partial_n
            if H[2*m]["key"] < H[2*m+1]["key"]
                p = 2*m
            else
                p = 2*m+1
            end
        else
            p = partial_n
        end
        H[m] = H[p]
        m = p
    end
    H[m] = H[partial_n]
    h["size"] = n-1
    return I
end
