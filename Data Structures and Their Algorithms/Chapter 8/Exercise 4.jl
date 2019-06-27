#=

Q.

Implement these operations using the data structure of Algorithm 8.1:

a. Union(S, T);

b. Intersection(S, T);

c. Complement(S), which replaces S by {u_0, ... , u_(N-1)} - S.

A.

a.

=#

function union(S, T)
    U = bit_vect_make_empty_set()

    for i = 1:S.count
        if S.bits[S.which[i]] == 1
            bit_vect_insert(S.which[i], U)
        end
    end
    for i = 1:T.count
        if T.bits[T.which[i]] == 1
            bit_vect_insert(T.which[i], U)
        end
    end

    return U
end

#=

b.

=#

function insersection(S, T)
    # Since when is not ordered, the nested for loop is needed.
    I = bit_vect_make_empty_set()
    
    for i = 1:S.count
        for j = 1:T.count
            if S.bits[S.which[i]] * T.bits[T.which[i]] == 1 # 1 and 1
                bit_vect_insert(S.which[i], I)
                break
            end
        end
    end

    return I
end

#=

c.

=#

function complement(S)
    C = bit_vect_make_empty_set()
    
    max = 0
    for i = 1:S.count
        if max < S.which[i]
            max = S.which[i]
        end
    end

    for i = 1:max
        if !valid(i, S) || bits[i] == 0
            bit_vect_insert(i, C)
        end
    end

    return C
end
