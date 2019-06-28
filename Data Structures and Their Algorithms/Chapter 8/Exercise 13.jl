#=

Q.

Let p be the number of bits needed for a pointer and r the number
of bits needed for a record, and let a be the load factor. Under what
circumstances, in terms of these three parameters, is the hash table
organization of Figure 8.7 more economical in its use of storage than
that of Figure 8.6?

A.

(r-p)*(empty nodes) - p*(loaded nodes) = r*(empty nodes) - p*(all nodes) => r*(1-a) - p > 0 (on average)

=#
