#=

Q.

Present an algorithm to delete a node from the red-black representation
of a 2-3 tree, following the style of Algorithm 7.4.

A.

=#

function delete(K, P)
    S = make_empty_stack()
    while p != nothing && P.key != K
        S.push(P)
        (d, P) = pair(K, P)
        S.push(d)
    end
    pop(P)
