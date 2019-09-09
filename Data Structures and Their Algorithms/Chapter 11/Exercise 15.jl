#=

Q.

This problem deals with efficient implementation of the Merge Sort
algorithm (Algorithm 1.7 on page 29).

a. Write an algorithm Merge(A[l..m], A[m+1..r]) that merges the
sorted subtables A[l..m] and A[m+1..r] into A[l..r] by using
an auxiliary table of size floor((r-1)/2) at most.

b. Design an "in-place" version of Merge that uses no extra memory.
What is its time complexity, and what inputs cause its worst-case
behavior? (For a linear-time algorithm, see the references.)

A.

a.

=#

function merge(A, l, m, r)
    n = floor(Int, (r-l)/2)
    C = zeros(n)
    for j in 1:n
        C[i] = A[i+l-1]
    end
    i = l
    j = m+1
    k = 1
    while i ≤ m
        if C[k] ≤ A[j]
            A[i] = C[k]
            k += 1
        else
            A[i] = A[j]
            j += 1
        end
        i += 1
    end
    while i ≤ r
        if C[k] ≤ A[j]
            A[i] = C[k]
            k += 1
        else
            A[i] = A[j]
            j += 1
        end
        i += 1
    end
end

#=

b.

=#

function merge(A, l, m, r)
    i = l
    j = m+1
    while i ≤ m && j ≤ r
        if A[i] ≥ B[j]
            swap(A[i], B[j])
            i += 1
        else
            j += 1
        end
    end
end
