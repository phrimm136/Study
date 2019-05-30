#=

Q.

Write the complete procedure AVLTreeDelete according to the algorithm
outlined in this section.

A.

=#

function pair(K, P)
    if K == P.key
        return (0, P)
    elseif K < P.key
        return (-1, P.LC)
    else
        return (1, P.RC)
    end
end
    

function AVLtree_delete(K, T)
    S = Stack()
    P = T
    height_dec = false
    while P != nothing && P.key != K
        S.push(P)
        if K < P.key
            P = P.LC
        else
            P = P.RC
        end
    end
    if P == nothing
        return
    end
    # P.key == K
    P = nothing
    height_dec = true
    while S.empty()
        P = S.pop()
        d1, C = pair(K, P)
        if height_dec == false
            d1 == 0
        end
        if P.balance == 0
            if d1 == 0
                height_dec = false
            else
                P.balance = d1
                height_dec = true
            end
        else
            d1 = -d1
            if d1 == 1
                C = P.RC
            else
                C = P.LC
            end
            
            if d1 == 0
                height_dec = false
            elseif P.balance == -d1
                P.balance = 0
                height_dec = false
            else
                d2, B = pair(K, C)
                if d2 == d1
                    P.balance = 0
                    rotate(P, -d1)
                else
                    d3, A = pair(K, B)
                    if d3 == d2
                        P.balance = 0
                        C.balance = 0
                    elseif d3 == -d2
                        P.balance = d2
                    else
                        P.balance = 0
                    end
                    rotate(C, -d2)
                    rotate(P, -d1)
                end
                height_dec = true
            end
        end
    end
end
