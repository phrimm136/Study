#=

Q.

A binary trie is a trie with binary branching at depth k based on the
kth bit of the key. Instead of extending the tree to have height equal
to the number of bits in the longest key, a branch is terminated when
it corresponds to but a single key, and the key itself is stored in a leaf
node.

a. Construct a binary trie from the keys of Figure 8.4 on page 264.

b. Show that the structure of a binary trie is independent of the order
in which the keys are inserted.

c. Write the algorithm for binary trie insertion.

A.

a.

                              (null)
                   /                           \
                  0                             1
                 / \                           /
                    1                         0 
                     \                       / \
                      1                     0   TURING
                     /                     / \ 
                    0                     0   1
                     \                   / \      \
                      1                 0   PEANO   1
                     /                 ..           ..
                    0                 / \
                   /           PASTEUR   PAVLOV
0                                 / \
/ \                       POINCARE    POISSON
          MAXWELL   1   
                   /    
                  0     
                   \    
                    1   
                    ..  
                   / \
             MENDEL   MENDELEEV

b.

Because of bit representations of each string is distinct (even permutations,) we can locate them in advance and the order doesn't matter.

c.

=#

function make_bitstring(S)
    B = ""
    for i in S
        B = string(B, bitstring(i)[4:8])
    end

    return B
end


function insert(S, T)
    p = T
    B = make_bitstring(S)

    for i = 1:length(B)
        if !(B[i] in keys(p))
            p[B[i]] = S
            return
        elseif isa(p[B[i]], String)
            S2 = p[B[i]]
            B2 = make_bitstring(S2)
            while B[i] == B2[i] && i < min(length(B), length(B2))
                p[B[i]] = Dict()
                p = p[B[i]]
                i += 1
            end
            if length(B) < length(B2)
                p[B2[i]] = S2
                p["10"[B2[i]+1-'0']] = S # if a string is the prefix of the other..?
            else
                p[B[i]] = S
                p["10"[B[i]+1-'0']] = S2
            end
            return
        else
            p = p[B[i]]
        end
    end
end

T = Dict()

insert("mendel", T)
insert("peano", T)
insert("turing", T)
insert("maxwell", T)
insert("mendeleev", T)
insert("poisson",T)
insert("pavlov", T)
println(T)
