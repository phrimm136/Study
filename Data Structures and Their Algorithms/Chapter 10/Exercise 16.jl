#=

Q.

Devise a sequence of requests that cannot be satisfied even if the
memory manager knows the entire sequence in advance, even though
at no time does the total size of the allocated and requested blocks
exceed the size of the heap. (Blocks cannot be moved once they have
been allocated.)

A.

Alloc(A, 6)
Alloc(B, 4)
Free(A)
Alloc(C, 3)
Alloc(D, 3)
Free(C)
Alloc(E, 2)
Free(B)
Alloc(F, 5) => fails.

=#
