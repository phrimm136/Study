#=

Q.

Consider the following alternative implementation of the dictionary operations by means of unordered linked lists. Allow multiple nodes to exist with the same key value, and implement Insert simply by adding a new node to the front of the list.

a. Give algorithms for the Insert, LookUp, and Delete operations and analyze their complexity. (Be sure to say what n is.)

b. Under what circumstances (as measured by the relative frequency of the three kinds of operations) might this implementation make sense?

A.

a.

=#


function insert(D, key, val)
    pushfirst!(D, [key, val])
end

# It always insert new dict element at first, so it takes O(1) time.

function lookup(D, key)
    for i in D
        if i[0] = key
            return i[1]
        end
    end
end

# (sigma i from 0 to n i) / n = (n+1)/2 = O(n)

function delete(D, key)
    for i in D
        if i[0] = key
            deleteat!(D, i)
        end
    end
end

# i from 0 to n => O(n)

#=

b.

This implementation makes sense under the circumstance that only the last value with the key is meaningful.

=#
