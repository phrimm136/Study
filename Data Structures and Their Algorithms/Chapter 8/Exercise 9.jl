#=

Q.

Choose a representation for the nodes of a Patricia tree, and write the
appropriate routines LookUp, Insert, and Delete.

A.

The nodes are same as trie version, but the leaves are string.

=#

function lookup(S, P)
    p = P
    for i = 1:length(S)
        if isa(p, String)
            return p == S[i:length(S)]
        elseif S[i] in keys(p)
            p = p[S[i]]
        else
            return false
        end
    end
end


function insert(S, P)
    p = P
    for i = 1:length(S)
        if !(S[i] in keys(p))
            p[S[i]] = S[i+1:length(S)]
            return
        elseif isa(p[S[i]], String)
            tmp = p[S[i]]
            p[S[i]] = Dict()
            p[S[i]][tmp[1]] = tmp[2:length(tmp)]
            p = p[S[i]]
        else
            p = p[S[i]]
        end
    end
end


function delete(S, P)
    function recur(S, p)
        if !(isa(p[S[1]], String))
            recur(S[2:length(S)], p[S[1]])
        end
        if isa(p[S[1]], String) || length(keys(p[S[1]])) == 0
            delete!(p, S[1])
        elseif length(keys(p[S[1]])) == 1
            p[S[1]] = string(collect(keys(p[S[1]]))[1], p[S[1]][collect(keys(p[S[1]]))[1]])
        end
    end

    if lookup(S, P)
        recur(S, P)
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
