function SequentialSearch(T::Array{Int},K::Int)::Int
    """
    Return position of K in table T, if it is present, otherwise -1
    """
    for i in 1:length(T)
        if T[i] == K
            return i
        end
    end
    return -1
end
