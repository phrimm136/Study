#=

Q.

Write the code for the first line of Algorithm 11.7 on page 392, which
orders the three elements A[l], A[floor((l + r)/2)], and A[r]. Try to be as
efficient as possible.

A.

=#

function quicksort(A, l, r)
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
        quicksort(A, l, j-1)
        quicksort(A, j+1, r)
    end
end

A = [9 8 7 6 5 4 3 2 1 0]

quicksort(A, size(A)[1], size(A)[2])
