#=

Q.

Give a version of the Quick Sort algorithm that is not tail-recursive
and that requires a stack that is only of height O(log n) to sort tables
of length n.

A.

=#

using DataStructures

function quicksort(A::Array, l::Int, r::Int)
    S = Stack{Array{Int, 1}}()
    push!(S, [l, r])
    while !(isempty(S))
        l, r = pop!(S)
        if A[l] > A[r]
            A[l], A[r] = A[r], A[l]
        end
        if A[l] > A[floor(Int, (l+r)/2)]
            A[l], A[floor(Int, (l+r)/2)] = A[floor(Int, (l+r)/2)], A[l] # swap. LUL
        end
        if A[floor(Int, (l+r)/2)] > A[r]
            A[floor(Int, (l+r)/2)], A[r] = A[r], A[floor(Int, (l+r)/2)]
        end
        if r-l > 2
            A[l+1], A[floor(Int, (l+r)/2)] = A[floor(Int, (l+r)/2)], A[l+1]
            i = l+1
            j = r
            v = A[l+1]
            while i < j
                i += 1
                while A[i] < v
                    i += 1
                end
                while A[j] > v
                    j -= 1
                end
                A[i], A[j] = A[j], A[i]
            end
            A[i], A[j] = A[j], A[i]
            A[j], A[l+1] = A[l+1], A[j]
            push!(S, [l, j-1])
            push!(S, [j+1, r])
        end
    end
end

A = [9 8 7 6 5 4 3 2 1 0]

quicksort(A, size(A)[1], size(A)[2])
