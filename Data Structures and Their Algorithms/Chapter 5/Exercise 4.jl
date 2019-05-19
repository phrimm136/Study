#=

Q.

Suppose that a two-dimensional array M with indices (0 .. n-1) x (0 .. n-1) is stored in row-major order in contiguous memory.
Write a program that transforms M so that it is stored in column-major order.
You may not copy M or use auxiliary storage that depends on n; all you may do is move elements within M.

A.

=#

function order_transform!(M)
    # Change the order of M from row-first to column-first.
    for i = 1:length(M)
        for j = (i+1):length(M[i])
            tmp = M[i][j]
            M[i][j] = M[j][i]
            M[j][i] = tmp
        end
    end
    return M
end

M = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
order_transform!(M)
M # Well done.
