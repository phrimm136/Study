#=

Q.

Let T[O..n-1] be a table of n data items that can be compared
for equality but not for relative order; likewise the data elements
cannot be used as indices into another table. (Therefore it would
be inherently impossible to sort the table, for example, since there
is no notion of one element being "smaller" than another.) Find a
linear-time algorithm for determining whether the table has a majority
element, that is, an element that occurs in more than n/2 of the table
positions. (You may allocate additional tables or other structures
to contain elements of T, numbers, or other data, and you may do
ordinary arithmetic on numbers, but the only thing you can do with
elements of the table T is to move them around and to tell whether
two are the same.)

A.

https://en.wikipedia.org/wiki/Boyer-Moore_majority_vote_algorithm

=#

function has_majority(T::Array{Int})
    m = T[1]
    cnt = 0
    for i in T
        if cnt == 0
            m = i
            cnt = 1
        elseif m == i
            cnt += 1
        else
            cnt -= 1
        end
    end
    cnt = 0
    for i in T
        if T[i] == m
            cnt += 1
        end
    end
    if cnt > length(T)/2
        return 1
    else
        return 0
    end
end

Ts = [rand(1:10, 10), rand(1:2, 10), ones(Int, 10)]

for i in Ts
    println(has_majority(i))
end

#=

iterating the table takes O(n) times, so the total time consumption is O(n).

=#
