#=

Q.

Rewrite Algorithm 11.5 as an iterative algorithm by eliminating the
tail-recursion.

A.

=#

function heapify(A, i, j)
    jj = j
    n = length(A)
    while n > 1
        if RC(jj) ≥ i && A[RC(jj)] ≤ A[LC(jj)] && A[RC(jj)] < A[jj]
            swap(A[jj], A[RC(jj)])
            jj = RC(jj)
        elseif LC(jj) ≥ i && A[LC(jj)] < A[jj]
            swap(A[jj[m A[LC(jj)]]])
            jj = LC(jj)
        end
        n = jj
    end
end
