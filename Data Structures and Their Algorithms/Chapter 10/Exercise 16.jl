#=

Q.

Devise a sequence of requests that cannot be satisfied even if the
memory manager knows the entire sequence in advance, even though
at no time does the total size of the allocated and requested blocks
exceed the size of the heap. (Blocks cannot be moved once they have
been allocated.)

A.

Alloc(A, 3)
Alloc(B, 2)
Alloc(C, 3)
Alloc(D, 2)
Free(A)
Alloc(E, 2)
Alloc(F, 1)
Free(B)
Alloc(G, 1)
Free(F)
Alloc(H, 2)
Free(C)
Free(H)
Alloc(I, 5) => fails.

|A|A|A|B|B|C|C|C|D|D|
|E|E|F|B|B|C|C|C|D|D|
|E|E|F| | |C|C|C|D|D|
|E|E|F| |G|C|C|C|D|D|
|E|E| | |G|C|C|C|D|D|
|E|E|H|H|G|C|C|C|D|D|
|E|E| | |G| | | |D|D|

=#
