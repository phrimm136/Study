#=

Q.

Write these skip list algorithms:

a. MakeEmptySet;

b. IsEmptySet;

c. Delete.

A.

a.

=#

struct node
    key::Int
    info::Int
    forward::Array
end

struct head
    level::Int
    head::node
end


function make_empty_set()
    N = node(typemax(Int), 0 [])
    return head(1, [N])
end

#=

b.

=#


function is_empty_set(L)
    if L.head.forward.key == typemax(Int)
        return true
    else
        return false
    end
end

#=

c.

=#

function delete(k, L)
    update = Array{node, 1}(undef, L.level)
    P = L.head
    for i = L.level:-1:1
        while P.forward[i].key < k
            P = P.forward[i]
            update[i] = P
        end
    end
    P = P.forward[1]
    if P.key == k
        for i = 1:L.level
            update[i].forward[i] = P.forward[i]
        end
    end
end
