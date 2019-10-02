#=

Q.

Design an algorithm for finding the median that is based on the par-
titioning step of Quick Sort. What are the worst-case and expected
time complexity of your algorithm? Can it be generalized to find the
kth largest, where k is a parameter that is an input to the algorithm?

A.

=#

function kth(T, k)
    pivot = rand(T)
    lows = [e for e in T if e < pivot]
    highs = [e for e in T if e > pivot]
    pivots = [e for e in T if e == pivot]
    if k <= length(lows)
        kth(lows, k)
    elseif k <= length(lows) + length(pivots)
        pivots[1]
    else
        kth(highs, k - (length(lows) + length(pivots)))
    end
end

T = rand(1:100, 10)
print(T, "\n", kth(T, 5))
