#=

Q.

Show how the binary buddy strategy would handle the following
sequence of requests, if the total memory size is 16:
A <- Allocate(3)
B <- Allocate(2)
C <- Allocate(3)
Free(B)
D <- Allocate(4)
Free(A)
Free(D)
E <- Allocate(5)
F <- Allocate(3)

A.

|A|A|A| | | | | | | | | | | | | |
|A|A|A| | | | | |B|B| | | | | | |
|A|A|A| |C|C|C| |B|B| | | | | | |
|A|A|A| |C|C|C| | | | | | | | | |
|A|A|A| |C|C|C| |D|D|D|D| | | | |
| | | | |C|C|C| |D|D|D|D| | | | |
| | | | |C|C|C| | | | | | | | | |
| | | | |C|C|C| |E|E|E|E|E| | | |
|F|F|F| |C|C|C| |E|E|E|E|E| | | |

=#
