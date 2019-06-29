#=

Q.

Choose a representation for the nodes of a trie, and write the appropriate
routines LookUp, Insert, and Delete.

A.

Each node is a dictionary whose keys are character of string and items point those sub-nodes.

=#


function lookup(S, T)
    p = T
    for i in S
        if i in keys(p)
            p = p[i]
        else
            return false
        end
    end
    return true
end


function insert(S, T)
    p = T
    for i in S
        if !(i in keys(p))
            p[i] = Dict()
        end
        p = p[i]
    end
end


function delete(S, T)
    function recur(S, T)
        if length(S) > 1
            recur(string(S[2:length(S)]), T[S[1]])
        end
        if length(keys(T[S[1]])) == 0
            delete!(T, S[1])
        end
    end

    if lookup(S, T) == true
        recur(S, T)
    end
end

a = Dict()

insert("asdf", a)
a
lookup("asdf", a)
lookup("asd", a)
insert("afds", a)
a
insert("asfd", a)
a
delete("asdf", a)
a
