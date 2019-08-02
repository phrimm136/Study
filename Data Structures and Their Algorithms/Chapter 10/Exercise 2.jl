#=

Q.

Simplify Algorithm 10.2 on page 348 under the assumption that
k = 1; that is, hat each cell has only a single pointer.

A.

=#

function link_inversion_mark(Q)
    P = nothing
    while true
        if Q != nothing && !atom(Q) && !marked(Q)
            mark(Q)
            tmp = P         # descend via C_0
            P = Q           #
            Q = Q["C"][0]   #
            Q["C"][0] = P   #
        elseif P == nothing
            return
        else
            tmp = Q         # ascend via C_0
            Q = P           #
            P = P["C"][0]   #
            P["C"][0] = tmp #
        end
    end
end
