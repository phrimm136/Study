#=

Q.

Suppose that sets are represented by splay trees. Give an implementation
of the following operation: Range(S, KI, K2), which changes
S to the set of all its members for which the key value K satisfies
K_1 < K < K_2. Analyze this implementation.

A.

=#

function range(S, K1, K2)
    splay(S, K1)
    while S.LC != nothing
        delete(S, S.LC)
        splay(S, K1)
    end
    splay(S, K2)
    while (S.RC != nothing)
        delte(S, S.RC)
        splay(S, K2)
    end
end

#=

Splaying K_1 and K_2 takes O(log n) time, but we should delete all out-range nodes, whose number is n/2 in average.
Rotating the children of the root takes constant time, so the time complexity of range is O(n).

=#
