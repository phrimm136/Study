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

function TT_insert(Ks::Array, I, TT::Dict)
    if TT == Dict()
        TT = Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[1], "item"=>Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[2], "item"=>I))
    else
        while true
            if TT["key"] < Ks[1]
                if TT["left"] == Dict()
                    TT["left"] = Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[1], "item"=>Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[2], "item"=>I))
                    return
                else
                    TT = TT["left"]
                end
            elseif TT["key"] > Ks[1]
                if TT["right"] == Dict()
                    TT["right"] = Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[1], "item"=>Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[2], "item"=>I))
                    return
                else
                    TT = TT["right"]
                end
            else
                TT = TT["item"]
                while true
                    if TT["key"] < Ks[2]
                        if TT["left"] == Dict()
                            TT["left"] = Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[1], "item"=>I)
                            return
                        else
                            TT = TT["left"]
                        end
                    elseif TT["key"] > Ks[2]
                        if TT=["right"] == Dict()
                            TT["right"] = Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[1], "item"=>I)
                            return
                        else
                            TT = TT["right"]
                        end
                    else
                        TT["item"] = I
                        return
                    end
                end
            end
        end
    end
end

#=

b.

=#

function TT_range_search(Ls::Array, Us::Array, TT::Dict, Op::Function)
    function TT_inner_range(L::Int, U::Int, T::Dict, Op::Function)
        if T == Dict()
            return
        end
        if L <= T["key"] <= U
            Op(T["item"])
        end
        if T["key"] >= L
            TT_inner_range(L, U, T["left"], Op)
        end
        if T["key"] <= R
            TT_inner_range(L, U, T["right"], Op)
        end
    end
    if TT == Dict()
        return
    end
    if Ls[1] <= TT["key"] <= Us[1]
        TT_inner_range(L[2], U[2], TT["item"], Op)
    end
    if T["key"] >= Ls[1]
        TT_range_search(Ls, Us, TT["left"], Op)
    end
    if T["key"] <= Rs[1]
        TT_range_search(Ls, Us, TT["right"], Op)
    end
end

#=

c.

Inserting each item in TT is equal to searching location to insert twice
and the second process is done after the first one, so search time is O((log n)^2),
and for n elements it takes O(n(log n)^2).

Range searching in TT is same as making 2d bounding path which takes O((log n)^2)
time and finding all elements in range which takes O(m).
Those processes are disjoint, so range searching in TT takes O(m + (log n)^2) time.

d.


e.

Denoting p as a space for pointer the space and n as the number of elements,
the consumption is 4*p*(n^2).

f.

=#

function TG_insert(Ks::Array, I::Int, TG::Dict, D::Int)
    # D is dimension
    if TG == Dict()
        if D != 1
            TG == Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[1], "Item"=>Dict())
            TG_insert(Ks[2:length(Ks)], I, TG, D-1)
        else
            TG == Dict("left"=>Dict(), "right"=>Dict(), "key"=>ks[1], "Item"=>I)
        end
    else
        if TG["key"] < Ks[1]
            if TG["left"] == Dict()
                if D != 1
                    TG["left"] = Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[1], "Item"=>Dict())
                    TG_insert(Ks[2:length(Ks)], I, TG["left"], D-1)
                else
                    TG["left"] = Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[1], "item"=>I)
                end
            else
                TG_insert(Ks, I, TG["left"], D)
            end
        elseif TG["key"] > Ks[1]
            if TG["right"] == Dict()
                if D != 1
                    TG["right"] = Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[1], "Item"=>Dict())
                    TG_insert(Ks[2:length(Ks)], I, TG["right"], D-1)
                else
                    TG["right"] = Dict("left"=>Dict(), "right"=>Dict(), "key"=>Ks[1], "item"=>I)
                end
            else
                TG_insert(Ks, I, TG["right"], D)
            end
        else
            TG["item"] = I
            return
        end
    end
end

#=

Time complexity
Insert - O(n(log n)^d)
Range - O(m + (log n)^d)

=#
