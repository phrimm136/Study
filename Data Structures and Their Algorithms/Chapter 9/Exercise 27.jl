#=

Q.

Consider the following data structure for range searching in two
dimensions. Items are organized into a binary search tree on their
key values in the first dimension; but attached to each node X of this
binary search tree is a separate binary search tree containing all items
in the subtree rooted at X, organized according to their key values in
the second dimension.

a. Give an algorithm for inserting an item into such a "tree of trees."

b. Give an algorithm for range searching such a structure.

c. Show that under reasonable assumptions about the distribution
of key values, inserting n items into an initially empty structure
takes expected time O(n(log n)2), and range searching a structure
with n items when there are m items in the range takes expected
time O(m + (log n) 2).

d. Show that the expected time to search a range in this structure
is O((logn)^2) if the objective is not to perform an operation on
every item in the range but to return a representation of the set of
all items in the range.

e. What are the memory requirements for this data structure?

f. Generalize this structure to more than two dimensions, and give
the corresponding results about expected time complexity for in-
sertions and range searches.

A.

a.

=#

function TT_insert(Ks, I, TT)

    if TT == Dict()
        TT = Dict("left"=>nothing, "right"=>nothing, "key"=>Ks[1], "item"=>Dict("left"=>nothing, "right"=>nothing, "key"=>Ks[2], "item"=>I))
    end
        
    p = TT
    while true
        if p["key"] < Ks[1]
            if p["left"] == nothing
                p["left"] = Dict("left"=>nothing, "right"=>nothing, "key"=>Ks[1], "item"=>Dict("left"=>nothing, "right"=>nothing, "key"=>Ks[2], "item"=>I))
                return
            else
                p = p["left"]
            end
        elseif p["key"] > Ks[1]
            if p["right"] == nothing
                p["right"] = Dict("left"=>nothing, "right"=>nothing, "key"=>Ks[1], "item"=>Dict("left"=>nothing, "right"=>nothing, "key"=>Ks[2], "item"=>I))
                return
            else
                p = p["right"]
            end
        else
            p = p["item"]
            while true
                if p["key"] < Ks[2]
                    if p["left"] == nothing
                        p["left"] = Dict("left"=>nothing, "right"=>nothing, "key"=>Ks[1], "item"=>I)
                        return
                    else
                        p = p["left"]
                    end
                elseif p["key"] > Ks[2]
                    if p["right"] == nothing
                        p["right"] = Dict("left"=>nothing, "right"=>nothing, "key"=>Ks[1], "item"=>I)
                        return
                    else
                        p = p["right"]
                    end
                else
                    p["item"] = I
                    return
                end
            end
        end
    end
end

#=

b.

=#


