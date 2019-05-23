#=

Q.

How much memory do skip lists take, beyond that needed to store
the data? Find the expected case and the worst case for a dictionary
of n items, in terms of n and the size of a pointer.
A.

Denote p that is the size of a pointer.
The expected extra memory is p(n + n/2 + n/4 + ...) = 2pn.
The worst extra memory is pn(max level = floor(lgn-1)), but this case occurs with extremely low probabilities.

=#
