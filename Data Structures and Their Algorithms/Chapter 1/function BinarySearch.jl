function BinarySearch(T::Array{Int}, a::Int, b::Int, K::Int)::Int
    """
    Return position of K in sorted table T, if it is present, otherwise -1
    """
    if a > b
        return -1
    end
    middle = floor(Int, (a+b) / 2)
    if K == T[middle]
        return middle
    elseif K < T[middle]
        return BinarySearch(T, a, middle-1, K)
    else # K > T[middle]
        return BinarySearch(T, middle+1, b, K)
    end
end
