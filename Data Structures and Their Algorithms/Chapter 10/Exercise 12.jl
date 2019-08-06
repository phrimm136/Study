#=

Q.

Using first fit with roving pointer, and starting with an empty block of
size 100, can the following sequence of requests be satisfied? Show
the state of memory at the end of the sequence, or when a failure
occurs.
A <- Allocate(40)
B <- Allocate(10)
Free(A)
C <- Allocate(20)
D <- Allocate(40)
Free(B)
E <- Allocate(25)

A.

Each space and upper character means ten, lower character means five blocks.

|A|A|A|A| | | | | | |
|A|A|A|A|B| | | | | |
| | | | |B| | | | | |
| | | | |B|C|C| | | |
|D|D|D|D|B|C|C| | | |
|D|D|D|D| |C|C| | | |
|D|D|D|D| |C|C|E|E|e|
