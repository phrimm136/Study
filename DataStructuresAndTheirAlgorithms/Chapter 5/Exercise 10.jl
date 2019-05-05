#=

Q.

Solve Problem 9 with the additional requirement that tables are deallocated as soon as possible, still with constant-time Access and Assign. (You will have to use slightly more storage overhead.)

A.

=#

function dealloc(M, addr)
    for i in reverse(addr)
        if length(i) == 1
            if !isnothing(M[i[1]])
                if all(map(isnothing, M[i[1]]))
                    M[i[1]] = nothing
                    filter!(x->x != i, M)
                end
            end
        else
            if !isnothing(M[i[1]][i[2]])
                if all(map(isnothing, M[i[1]][i[2]]))
                    M[i[1]][i[2]] = nothing
                    filter!(x->x != i, M)
                    
                end
            end
        end
    end
end


function initialize(M, addr, v)
    for i = 1:length(M)
        if !isnothing(M[i])
            for j = 1:length(M[i])
                if !isnothing(M[i][j])
                    for k = 1:length(M[i][j])
                        M[i][j][k] = v
                    end
                end
            end
        end
    end
    dealloc(M, addr)
end


function access(M, addr, i, j, k)
    dealloc(M, addr)
    return M[i][j][k]
end


function assign(M, addr, i, j, k, v)
    M[i][j][k] = v
    dealloc(M, addr)
end


function iterate(M, addr)
    dealloc(M, addr)
    for i = 1:length(M)
        if !isnothing(M[i])
            println(i, " ")
            for j = 1:length(M[i])
                if !isnothing(M[i][j])
                    print(j, ": ")
                    for k = 1:length(M[i][j])
                        if (!isnothing(M[i][j][k]))
                            print(M[i][j][k], " ")
                        end
                    end
                    println("")
                end
            end
        end
    end
end


function newtable(M, addr, n, i=0, j=0)
    if i == 0
        resize!(arr, n)
        fill!(M, nothing)
    elseif j == 0
        M[i] = Array{Any}(nothing, n)
        dealloc(M, addr)
        push!(addr, [i])
    else
        M[i][j] = Array{Any}(nothing, n)
        dealloc(M, addr)
        push!(addr, [i, j])
    end
end

addr = []
arr = []
newtable(arr, addr, 5)

newtable(arr, addr, 6, 1)
newtable(arr, addr, 4, 1, 4)
assign(arr, addr, 1, 4, 2, 10)

newtable(arr, addr, 6, 4)
newtable(arr, addr, 4, 4, 1)
newtable(arr, addr, 4, 4, 2)
assign(arr, addr, 4, 2, 3, 20)

iterate(arr, addr)

newtable(arr, addr, 4, 1, 2)
initialize(arr, addr, 3)

iterate(arr, addr)
