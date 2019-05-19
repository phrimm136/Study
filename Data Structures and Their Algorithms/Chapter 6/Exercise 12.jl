#=

Q.

a. Write the insertion algorithm for a dictionary represented asan ordered table, that is, the algorithm Insert(K, I, T[O. .n - 1]). Assume that the maximum length of the table is given by the constant N, and attempting to exceed this bound is an error condition. Also assume that the current size of the table can be changed simply by changing the value of n within the algorithm. What is the order of the time complexity of your algorithm?

b. Under the same assumptions, write the algorithm for deleting an item from a dictionary represented asan ordered table.

A.

a.

=#

struct pair
    key::String
    info::Any
end


function insert_dict!(K, I, T)
    if length(T) == N # Assume that length function takes constant time; it is saved in function with pseudo code.
        error("Attempt to insert into full dict; abort")
    elseif length(T) == 0
        push!(T, pair(K, I))        
    else
        i = 1
        while K < T[i].key
            i += 1
        end
        splice!(T, i, [T[i], pair(K, I)])
    end
end

N = 100
T = []

insert_dict!("asdf", 1, T)
insert_dict!("qwerty", 3, T)
insert_dict!("hell world", 2, T)
T

# (sigma i from 0 to n i) / n = (n+1)/2 = O(n)

#=

b.

=#

function delete_dict!(K, T)
    for i = 1:length(T)
        if (K == T[i].key)
            splice!(T, i, )
            return
        end
    end
end


delete_dict!("asdf", T)
T
