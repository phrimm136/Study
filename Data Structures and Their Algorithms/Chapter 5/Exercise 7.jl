#=

Q.

Implementhe abstract operation Iterate for arrays represented as shown in Figure 5.3 on page 138.

A.

=#

function initialize(M, v)
    # Initialize each element of M to v.
    M["count"] = 1
    M["default"] = v
end


function valid(i, M)
    # Return true if M[i] has been modified since the last initialize.
    return 1 <= M["when"][i] < M["count"] && M["which"][M["when"][i]] == i
end


function access(i, M)
    # Return M[i].
    if valid(i, M)
        return M["data"][i]
    else
        return M["default"]
    end
end


function assign(M, i, v)
    # Set M[i].
    if !valid(i, M)
        M["when"][i] = M["count"]
        M["which"][M["count"]] = i
        M["count"] = M["count"] + 1
    end
    M["data"][i] = v
end


function iterate(M)
    # Iterate M.
    for i =  1:length(M["data"])
        if (valid(i, M))
            print(M["data"][i], ' ')
        else
            print(M["default"], ' ')
        end
    end
end


arr = Dict("count" => 1, "default" => 0, "which" => fill(0, 10), "when" => fill(0, 10), "data" => fill(0, 10))

initialize(arr, 1)
assign(arr, 2, 2)
assign(arr, 10, 10)
iterate(arr)
