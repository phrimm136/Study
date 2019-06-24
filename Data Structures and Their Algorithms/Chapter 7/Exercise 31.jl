#=

Q.

Design an implementation for a set abstract data type with the following
operations: LookUp(K, S), which locates the record with key K
in set S; and InsertNext(K, I, S), which inserts into S the pair <K, I>.
The following special restrictions apply on the use of InsertNext: either
S is empty, or K is the successor of the key value of the last
operation performed (a LookUp or an InsertNext). For example, the
following sequence of operations is valid: insert 1, 5, 10, 30; find 5;
insert 6, 7; find 30, 1; insert 3; find 7; insert 8, 9. Your algorithm
should perform any sequence of insertions and finds on an initially
empty set in time O(f log n + n), where n is the number of insertions
and f is the number of finds. (Hint: Use a splay tree, but don't
actually insert the records until a Find is performed; instead save the
insertions in a list and converthe list into a complete binary tree at
the appropriate time.)

A.

=#

function lookup(K, S)
    if S == nothing
        return nothing
    end

    p = S
    while K != p.key
        if p == nothing
            return "None"
        elseif K > p.key
            p = p.right
        else
            p = p.left
        end
    end

    splay(K, S)

    return p.item
end


function successor(p)
    while p.left != nothing
        p = p.left
    end

    return p.key
end


function insert_next(K, I, S)
    p = S
            
    if S == nothing
        return
    elseif p.key < K < successor(p)
        N = newnode(K, I, nothing, p.right)
        p.right = N
    end

    while true
        if K > p.key
            if p.right == nothing
                N = newnode(K, I, nothing, nothing)
                p.right = N
                break
            else
                p = p.right
            end
        else
            if p.left = nothing
                N = newnode(K, I, nothing, nothing)
                p.left = N
                break
            else
                p = p.left
            end
        end
    end

    splay(K, S)
end
