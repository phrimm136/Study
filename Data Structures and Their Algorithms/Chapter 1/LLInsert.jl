include("NewNode.jl")

function LLInsert(K::Int)
    """
    Insert a cell containing key K in list if none exists already
    """
    S = nothing
    P = list
    while P != nothing && P.key < K
        S = P
        P = P.next
    end
    if P != nothing && P.key == K
        return
    end
    if S == nothing
        list = NewNode(K, list)
    else
        S.next = NewNode(K, P)
    end
end

function LLInsert(K::Int, P::LList)
    """
    Insert a cell containing key K in list if none exists already
    """
    S = nothing
    while P != nothing && P.key < K
        S = P
        P = P.next
    end
    if P != nothing && P.key == K
        return
    end
    S.next = NewNode(K, P)
end
