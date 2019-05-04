#=

Q.

a. Generalize Problem 4 to arrays with indices (0 .. n) x (O .. m).

b. Further generalize Problem 4 to k-dimensional arrays with arbitrary index sets.

A.

a.

=#

function order_transform!(M)
    # Change the order of M from row-first to column-first.
    len = [length(M), length(M[1])]
    if len[1] == len[2]
        for i = 1:length(M)
            for j = (i+1):length(M[i])
                tmp = M[i][j]
                M[i][j] = M[j][i]
                M[j][i] = tmp
            end
        end
    else
        i = 1
        i1 = 1
        for j = 2:ceil(Int, len[2] / 2)
            j1 = j
            tmp2 = M[i][j]
            while true
                tmp1 = M[j][i]
                M[j][i] = tmp2
                tmp2 = tmp1
                len_linear = (j-1) * len[2] + i
                i = ceil(Int, len_linear / len[1])
                j = (len_linear-1) % len[1] + 1
                if (i == i1 && j == j1)
                    break
                end
            end
        end
    end
    return M
end


M = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15], [16, 17, 18, 19, 20], [21, 22, 23, 24 ,25], [26, 27, 28, 29, 30]]
order_transform!(M)
M # Well done.


#=

b.

later.

=#


function length_N(M)
    arr = M
    len = []
    while isa(arr, Array)
        push!(len, arr[1])
        arr = arr[1]
    end
    return len
end


function order_transform_N!(M)
    len = length_N(M)
    i = 1
    i1 = 1
    for j = 2:ceil(Int, len[2] / 2)
        j1 = j
        tmp2 = M[i][j]
        while true
            tmp1 = M[j][i]
            M[j][i] = tmp2
            tmp2 = tmp1
            len_linear = (j-1) * len[2] + i
            i = ceil(Int, len_linear / len[1])
            j = (len_linear-1) % len[1] + 1
            if (i == i1 && j == j1)
                break
            end
        end
    end
    return M
end
