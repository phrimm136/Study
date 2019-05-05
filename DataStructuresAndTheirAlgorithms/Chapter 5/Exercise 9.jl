#=

Q.

Choose a record structure for 3-dimensionalrrays represented by hierarchical tables as in Figure 5.6 on page 141, and write appropriate procedures Initialize, Access, Assign, and Iterate (with the last index varying fastest).
You may use the function NewTable(n) which creates a table of n pointers. Unused tables should eventually be deallocated so that the storage can be reused (assume a function FreeTable that returns a table to the storage allocator).
Since we require that Access and Assign use only constant time, and since we want to use a minimum of storage overhead, you should check for table deallocation only during Iterate and Initialize.

A.

=#

function initialize(M, v)
    for i = 1:length(M)
        if !isnothing(M[i])
            if all(map(isnothing, M[i]))
                M[i] = nothing
            else
                for j = 1:length(M[i])
                    if !isnothing(M[i][j])
                        for k = 1:length(M[i][j])
                            M[i][j][k] = v
                        end
                    end
                end
            end
        end
    end
end


function access(M, i, j, k)
    return M[i][j][k]
end


function assign(M, i, j, k, v)
    M[i][j][k] = v
end


function iterate(M)
    for i = 1:length(M)
        if !isnothing(M[i])
            if all(map(isnothing, M[i]))
                M[i] = nothing
            else
                println(i, " ")
                for j = 1:length(M[i])
                    if !isnothing(M[i][j])
                        if all(map(isnothing, M[i][j]))
                            M[i][j] = nothing
                        else
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
    end
end


function newtable(n)
    return Array{Any}(nothing, n)
end


arr = newtable(5)
arr[1] = newtable(6)
arr[4] = newtable(6)
arr[1][4] = newtable(4)
arr[1][6] = newtable(4)
arr[4][2] = newtable(4)

assign(arr, 1, 4, 2, 10)
assign(arr, 4, 2, 3, 20)

iterate(arr)

arr[1][6] = newtable(4)
initialize(arr, 3)

iterate(arr)
