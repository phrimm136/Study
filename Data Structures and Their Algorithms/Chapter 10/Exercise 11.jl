#=

Q.

Show how the best fit, first fit with roving pointer, and worst fit
strategies would handle the following sequence of requests, if the
total memory size is 9:
A <- Allocate(3)
B <- Allocate(2)
C <- Allocate(1)
Free(A)
D <- Allocate(3)
Free(B)
E <- Allocate(5)

A.

best fit

|A|A|A| | | | | | |
|A|A|A|B|B| | | | |
|A|A|A|B|B|C| | | |
| | | |B|B|C| | | |
|D|D|D|B|B|C| | | |
|D|D|D| | |C| | | |
Cannot allocatee E.

first fir with roving pointer

|A|A|A| | | | | | |
|A|A|A|B|B| | | | |
|A|A|A|B|B|C| | | |
| | | |B|B|C| | | |
| | | |B|B|C|D|D|D|
| | | | | |C|D|D|D|
|E|E|E|E|E|C|D|D|D|

worst fit

|A|A|A| | | | | | |
|A|A|A|B|B| | | | |
|A|A|A|B|B|C| | | |
| | | |B|B|C| | | |
|D|D|D|B|B|C| | | |
|D|D|D| | |C| | | |
Cannot allocate E.

=#
