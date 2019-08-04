#=

Q.

Design a compaction algorithm for fixed-sized blocks that makes only
a single pass over the memory being compacted and uses only a
constant amount of additional memory.

A.

=#

function compact()
    destination = dest_first
    P = from_first
    while P < from_first + size
        if marked(P)
            for p in link(P)
                p = destination
            end
            copy(P, destination)
        end
        destination += block_size
        P += block_size
    end
end
