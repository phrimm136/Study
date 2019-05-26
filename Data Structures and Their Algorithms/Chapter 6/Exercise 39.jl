#=

Q.

Implement the following alternative to Algorithm 6.9 for deletion
from a binary search tree dictionary: once the node to be deleted and
its inorder successor have been located, copy the Key and Info fields
from the latter to the former, and change a single pointer.

A.

=#

function binary_search_delete(k, P)
    while P != nothing && P.key != k
        if k < P.key
            P = P.LC
        else
            P = P.RC
        end
    end
    if P == nothing
        return
    elseif P.RC == nothing
        P = P.LC
    else
        Q = P.RC
        while Q.LC != nothing
            Q = Q.LC
        end
        P.Key = Q.Key
        P.Item = Q.Item
        Q = Q.RC
    end
end
