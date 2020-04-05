function NewNode(K::Int, P::Union{LList, Nothing})::LList
    Q = LList(K, P)
    return Q
end
