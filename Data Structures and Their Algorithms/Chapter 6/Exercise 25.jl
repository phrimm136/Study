#=

Q.

A padded list is an ordered list stored in a table in contiguous memory that is somewhat larger than the actual number of elements in the list. With padded lists, the dictionary operations can all be implemented in expected time O(loglogn). Let k be an integer greater than 0. Initially one out of every k + 1 positions in the table is unused; if N is the length of the table, then an auxiliary table of N bits records which table positions are in use. (Thus n, the number of elements actually in the dictionary, is about kN/(k + 1) initially. An "empty" table position is actually filled with a copy of the next lower list element to facilitate searching.) As insertions and deletions are performed, this regular pattern of empty slots is destroyed.

a. Write the LookUp and Delete routines for padded lists.

b. Explain how to insert an element in a padded list, on the assumption that there is an empty slot in the table.

c. The insertion method of part (b) is likely to take a long time if the table grows through insertions until it is nearly full (that is, if n N), since relatively few gaps will remain. Likewise, searching the table of length N will be too slow if n,the actual number of elements, shrinks through deletions to a value much smaller than N. For these reasons we reinitialize the table into a new block of memory if the ratio n/N drops below some fixed threshold aor exceeds some fixed threshold: (where 0 < a < k/(k + 1) < 3 < 1). We assume that a new block of memory of size N' can be obtained in time O(N'). Show that under these circumstances, LookUp, Insert, and Delete can all be implemented torun in expected time O(log log n), including time for all initializations and reinitializations.
(Hint: The only tricky part is to assess the expected amount of time to find a gap in which to do an insertion. Withoutrying to calculate the expected number of positions that will need to be inspected, argue that this number depends on the constant parameters of the algorithm [such as k, a, and yh], but not on the size of the data set on which the algorithm is run [that is, not on n].)

A.

a.

=#

function LookUp(k, T, N)
    left = 1
    right = length(T)
    while true
        middle = floor(Int, (left + right) / 2)
        if T[middle]["key"] == k
                return T[middle]["item"]
        elseif T[middle]["key"] < k
            if T[middle]["key"] == T[middle*3/2]["key"]
                left = middle*3/2+1
            else
                left = middle+1
            end
        else
            if T[middle]["key"] == T[middle/2]["key"]
                right = middle/2-1
            else
                right = middle-1
            end
        end
    end
end


function Delete(k, T, N)
    prev = 1
    for i in N
        if T[i] == k && N[i] == 1
            for j = prev:i
                T[j] = T[i+1]
            end
            N[i] = 0
            return
        end
        if n[i] == 1
            prev = i
        end
    end
end


#=

b.

Take an empty slot between previous and next element (maybe middle between them), assign an input item to it and fill the forward empty slots with the input item.

c.

=#

