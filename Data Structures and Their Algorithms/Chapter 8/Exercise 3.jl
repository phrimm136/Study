#=

Q.

Modify the routines of Algorithm 8.1 so that attempts to insert an
item that is already in the set, or to delete an item that is not already
in the set, are error conditions rather than null operation.

A.

=#

function bit_vec_insert(i, S)
    if !valid(i, S)
        S.count += 1
        S.when[i] = S.count-1
        S.which[S.count-1] = i
    elseif S.bits[i] == 1
        error("Item is already in the set")
    else
        S.bits[i] = 1
    end
end


function bit_vec_delete(i, S)
    if valid{i, S} && bits[i] == 1
        S.bits[i] = 0
    else
        error("Item is not yet in the set")
    end
end
