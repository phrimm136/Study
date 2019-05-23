#=

Q.

If the worst-case performance ofinterpolation search is really a concern,
it is possible to guarantee O(log n) worst-case performance
while maintaining O(log log n) expected-case performance by alternating 
steps of binary and interpolation search. Present an algorithm
that does this gracefully, and justify the time bound.

A.

=#

function alternating_search(k, T)
    n = 0
    left = 0
    right = length(T)
    count = 1
    while true
        if left > right
            return count
        elseif n == 0
            p = (k - (left-1 == -1 ? -1 : T[left-1])) / ((right+1 == length(T)+1 ? N : T[right+1]) -
                                                         (left-1 == -1 ? -1 : T[left-1]))
            middle = floor(Int, p*(right - left + 1)) + left
        else
            middle = floor(Int, (left + right) / 2)
        end

        if (T[middle] == k)
            return count
            # return middle
        elseif (T[middle] < k)
            left = middle+1
        else
            right = middle-1
        end
        count += 1
        n = (n+1)%2
    end
end


T = [101 102 103 104 105 106 107 108 109 110]
N = 1000

for i in T
    println(i, "\t", alternating_search(i, T))
end

#=

101 => 1
102 => 3
103 => 3
104 => 3
105 => 3
106 => 2
107 => 3
108 => 5
109 => 4
110 => 5

The worst time case of interpolation search algorithm is that middle is incrementing once for each iteration. But in alternating search, even if the interpolation search part takes the worst case, the alternating binary search part halves the table, so the worst case complexity is O(log n).

=#
