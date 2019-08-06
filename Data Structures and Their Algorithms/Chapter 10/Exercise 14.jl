#=

Q.

In each of the following cases, find a sequence of allocation and
deallocation requests that defeats the strategy and has as few requests
as possible.

a. Construct a sequence of requests that defeats the best fit allocation
strategy.

b. Construct a sequence of requests that defeats the first fit allocation
strategy.

c. Construct a sequence of requests that defeats the worst fit alloca-
tion strategy.

A.

In ten blocks,

a.

Allocation(A, 4)
Allocation(B, 1)
Allocation(C, 1)
Free(A)
Allocation(D, 4)
Free(B)
Allocation(E, 5) => fails.

b.

Allocation(A, 3)
Allocation(B, 3)
Free(A)
Allocation(C, 3)
Allocation(D, 4) => fails.

c.

Allocation(A, 4)
Allocation(B, 3)
Free(A)
Allocation(C, 3)
Allocation(E, 4) => fails.

=#
