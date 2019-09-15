#=

Q.

Find a table of the numbers 0, 1, ..., 9 that causes Algorithm 11.7
to behave as badly as possible.

A.

almost sorted table has worst time consumption.

0 1 2 3 4 6 5 7 8 9
0 4 2 3 1 6 5 7 8 9
0   1 2 3 4 6 5 7 8 9
0   6 2 3 4 1 5 7 8 9
0   1   2 3 4 6 5 7 8 9
0   1   6 3 4 2 5 7 8 9
0   1   2   3 4 6 5 7 8 9
0   1   2   5 4 6 3 7 8 9
0   1   2   3 4 5   6 7 8 9
...
0 1 2 3 4 5 6 7 8 9

=#
