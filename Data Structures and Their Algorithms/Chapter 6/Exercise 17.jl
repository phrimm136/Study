#=

Q.

Consider the following sequence of twenty numbers: 71, 147, 175,
182, 270, 290, 303, 335, 356, 379, 508, 525, 559, 590, 591, 610,
684, 710, 789, 873. Use both binary search and interpolation search
to find each of the numbers 175, 290, 356, 525, 591, and 710. In this
small sample, does interpolation search use fewer comparisons than
binary search?

A.

=#

function binary_search(k, T)
    left = 1
    right = length(T)
    count = 1

    while true
        if left > right
            return count
        end
        
        middle = floor(Int, (left + right) / 2)

        if (T[middle] == k)
            return count
            # return middle
        elseif (T[middle] < k)
            left = middle+1
        else
            right = middle-1
        end
        count += 1
    end
end


function interpolation_search(k, T)
    left = 0
    right = length(T)
    count = 1

    while true
        if left > right
            return count
        end
        
        p = (k - (left-1 == -1 ? -1 : T[left-1])) / ((right+1 == length(T)+1 ? N : T[right+1]) -
                                                     (left-1 == -1 ? -1 : T[left-1]))
        middle = floor(Int, p*(right - left + 1)) + left

        if (T[middle] == k)
            return count
            # return middle
        elseif (T[middle] < k)
            left = middle+1
        else
            right = middle-1
        end
        count += 1
    end
end


function search_compare(E, T)
    println("\tbinary\tinterpolation")
    for k in E
        println(k, "\t", binary_search(k, T), "\t", interpolation_search(k, T))
    end
end


T = [71, 147, 175, 182, 270, 290, 303, 335, 356, 379, 508, 525, 559, 590, 591, 610, 684, 710, 789, 873]
E = [175, 290, 356, 525, 591, 710]
N = 1000
search_compare(E, T)


#=

         binary    interpolation
175      4         1
290      4         1
356      5         3
525      3         2
591      2         3
710      3         4

Generally, interpolation search use fewer comparisons than binary search.

=#
