#=

Q.

Let M be an upper-triangular matrix of order n represented as described on page 142.
Show how to determine i and j given n and the address in memory of element M[i,j].
(As usual, each element occupies L physical memory cells and M[0,0] begins at address M.)

A.

Get a number of elements(E) from (M[i,j] - M) / L.
For i from 0, subtract n, n-1, ... from E and increment i until the rest of E is larger than n-k.
And the rest of E plus i is j.

=#
