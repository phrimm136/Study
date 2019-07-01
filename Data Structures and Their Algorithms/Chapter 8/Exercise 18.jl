#=

Q.

The following idea leads to an open addressing strategy called binary
tree hashing that is superior to ordered hashing for LookUp operations,
though it is more costly for insertions. When a collision is
discovered between a key K that is being inserted and a key K' that
is already in the hash table, consider the next positions in the probe
sequences of K and K'. If one of these is empty, move the corresponding
item to that position, and put (or keep) the other in the
position originally considered. On the other hand, if the next positions
in the probe sequences of both K and K' are occupied, say by
L and L', then consider the following four positions: the subsequent
positions in the probe sequences for K and K', and the next positions
in the probe sequences for L and L'. Once again, if one of these four
positions is empty, put the appropriate key in that position, and rearrange
the others. At each additional stage that needs to be considered,
the number of probe positions under consideration doubles (though
they do not all need to be distinct), so an empty position is likely
to be located before many stages have been considered, and probe
sequences are likely to be kept short.

a. Insert the names of Figure 8.5 on page 266 into a hash table with
binary tree hashing, using double hashing to calculate the probe
sequence.

b. Write the detailed algorithm for Insert and LookUp in a hash table
of this kind.

A.

a.

1  
2  S.Adams 1
3  W.Hooper 3
4  J.Adams 1
5
6  T.Heyward 1
7
8  J.Hancock 1
9
10 C.Braxton 1
11 J.Hart 1
12 W.Floyd 2
13
14 C.Carroll 1
15 A.Clark 1
16
17 B.Franklin 1
18 L.Hall 4
19 B.Gwinnett 1
20 J.Hewes 2
21 W.Ellery 3
22
23 E.Gerry 1
24 B.Harrison 1
25 G.Clymer 3
26
27
28
29 J.Bartlett 3
30
31 S.Chase 3

b.

=#

function bts_insert(K, T)
    function recur(L, L_, h, h_, H2, H2_)
        if (T[h] == nothing)
            if K["name"] > T[h-H2]["name"]
                T[h] = K
            else
                T[h] = T[h-H2]
                T[h-H2] = K
            end
        elseif (T[h_] == nothing)
            
        else
            if (K["name"] < T[h]["name"])
                H2 = T[h]["H2"]
                tmp = T[h]
                T[h] = K
                K = tmp
            end
            recur(K, h+H2, H2)
        end
    end
    if (T[K["H"]] == nothing)
        T[K["H"]] = K
    else
        recur(K, T[K["H"]], K["H"] + K["H2"], T[K["H"]]["H"] + T[K["H"]]["H2"], K["H2"], T[K["H"]]["H2"])
    end

