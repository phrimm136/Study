#=

Q.

 Suppose we wish to implement upper-triangular matrices in a programming language that supports multidimensional arrays efficiently.
Devise a space-efficient representation that requires no explicit multiplications, and generalize your solution to k-dimensional uppertriangular matrices.
(In practice, such techniques are rarely better than using one-dimensional arrays since the arithmetic saved is performed anyway by the underlying implementation of multidimensional arrays.)

A.

=#

function mk_up_tri(n)
    M = Array{Any}(nothing, n)
    cnt = 1
    for i = 1:n
        M[i] = fill(0, n)
        for j = i:n
            M[i][j] = cnt
            cnt += 1
        end
    end
    return M
end


function it_up_tri(M)
    for i = 1:length(M)
        for j = i:length(M[i])
            print(M[i][j], " ")
        end
        println("")
    end
end


arr = mk_up_tri(4)
it_up_tri(arr)


# k-dimension

function mk_up_tri_k(n)
    function mk_up_tri_k_rec(k, c)
        if (k == 1)
            M = fill(0, n)
            for i = c:n
                M[i] = cnt
                cnt += 1
            end
        else
            M = Array{Any}(nothing, n)
            for i = 1:n
                M[i] = mk_up_tri_k_rec(k-1, c+i-1)
            end
        end
        return M
    end

    cnt = 1
    return mk_up_tri_k_rec(n, 1)
end


function it_up_tri_k(M)
    function it_up_tri_k_rec(M, k, c)
        if (k == 1)
            for i = c:n
                print(M[i], " ")
            end
            println("")
        else
            for i = k:n
                print(" ")
            end
            for i = 1:n
                it_up_tri_k_rec(M[i], k-1, c+i-1)
            end
        end
    end

    n = length(M)
    it_up_tri_k_rec(M, n, 1)
end


arr = mk_up_tri_k(3)
it_up_tri_k(arr)
