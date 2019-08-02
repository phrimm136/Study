#=

Q.

Recode Algorithm 10.2 without using an auxiliary stack, under the
assumption that each cell has a field Direction that can hold a value
in the range 0..k-1. All Direction fields are initially 0, and should
be 0 when the marking is complete.

A.

=#

function link_inversion_mark(Q)
    P = nothing
    while true
        if Q != nothing && !atom(Q) && !marked(Q)
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
            Q["direction"] = (Q["direction"] + 1) % k
            if Q["direction"] != 0
                tmp = P         # descend via C_k
                P = Q           #
                Q = Q["C"][Q["direction"]]   #
                Q["C"][Q["direction"]] = P   #
            end
        end
    end
end
