#=

Q.

Choose a representation for the nodes of a de la Braindais tree, and
write the appropriateroutines LookUp, Insert, and Delete.

=#


function lookup(S, T)
    p = T
    for i in S
        while p != nothing
            if p["item"] == i
                p = p["next"]
                break
            end
            p = p["other"]
        end
        if p == nothing
            return false
        end
    end
    return true
end


function insert(S, T)
    if T == Dict("item" => Int, "other" => Union{Nothing, Dict}, "next" => Union{Nothing, Dict})
        T["item"] = S[1]
        T["other"] = nothing
        T["next"] = nothing
        S = S[2:length(S)]
    end
    p = T
    for i in S
        if isa(p["next"], Nothing)
            p["next"] = Dict("item" => i, "other" => Union{Nothing, Dict}, "next" => Union{Nothing, Dict})
            p = p["next"]
        else
            p = p["next"]
            while i < p["item"] && !(isa(p["other"], Nothing))
                p = p["other"]
            end
            if p["item"] != i
                tmp = Dict("item" => i, "other" => p["other"], "next" => Union{Nothing, Dict})
                p["other"] = tmp
                p = p["other"]
            end
        end
    end
end

a = Dict("item" => Int, "other" => Union{Nothing, Dict}, "next" => Union{Nothing, Dict})

insert("asdf", a)
