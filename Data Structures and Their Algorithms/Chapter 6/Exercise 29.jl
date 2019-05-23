#=

Q.

Write an algorithm that merges two skip lists into one.

A.

=#

load_path("Exercise 28.jl")

function merge(L1, L2)
    N = node(typemax(Int), 0, [])
    lv_max = max(L1.level, L2.level)
    L = head(lv_max, Array{node, 1}(N, lv_max))
    P = L.head
    update = P.forward
    P1 = L1.head
    P2 = P2.head
    while P1.forward[1].key < typemax(Int) && P2.forward[1].key < typemax(Int)
        if P1.forward[1].key <= P2.forward[1].key
            for i = 1:length(P1.forward[1].forward)
                tmp = update[i]
                update[i] = deepcopy(P1.forward[i])
                update[i].forward[i] = tmp
                update[i] = update[i].forward[i]
            end
            P1 = P1.forward[1]
        else
            for i = 1:length(P2.forward[1].forward)
                tmp = update[i]
                update[i] = deepcopy(P2.forward[i])
                update[i].forward[i] = tmp
                update[i] = update[i].forward[i]
            end
            P2 = P2.forward[1]
        end
        P = P.forward[1]
    end
    if P1.forward[1].key == typemax(Int)
        while P2.forward[1].key < typemax(Int)
            for i = 1:length(P2.forward[1].forward)
                tmp = update[i]
                update[i] = deepcopy(P2.forward[i])
                update[i].forward[i] = tmp
                update[i] = update[i].forward[i]
            end
            P2 = P2.forward[1]
        end
    else
        while P1.forward[1].key < typemax(Int)
            for i = 1:length(P1.forward[1].forward)
                tmp = update[i]
                update[i] = deepcopy(P1.forward[i])
                update[i].forward[i] = tmp
                update[i] = update[i].forward[i]
            end
            P1 = P1.forward[1]
            P = P.forward[1]
        end
    end
    return L
end
