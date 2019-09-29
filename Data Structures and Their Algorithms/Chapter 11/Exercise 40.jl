#=

Q.

Illustrate the number of runs on the various tapes as Polyphase Merge
Sort is run on four tapes with 24, 20, 13, and 0 runs initially. Show
the length of the runs on each tape, on the hypothesis that the runs
were all of equal length initially. Calculate the average number of
times a datum is moved in this process, and compare the result to the
number of times a datum would be moved if the four tapes were used
to sort the 57 runs by Balanced Multiway Merge instead, starting with
24, 23, 0, and 0 runs on the four tapes.

A.

0 0 1 1 2 4 7 13 24 44 81

24 11  4 0 2 1 0
20  7  0 4 2 1 0
13  0  7 3 1 0 1
0  13  6 2 0 1 0

1 1 1 0 17 17 0
1 1 0 9 9  9  0
1 0 5 5 5  0  57
0 3 3 3 0  31 0

The average movement of datum is (13*3 + 7*5 + 4*9 + 2*17 + 1*31 + 1*57) / 57 = 4.07

Sorting 57 runs with four tapes by Balanced Multiway Merge:
since 24 + 23 != 57, I will do sorting with 29, 28, 0, 0.

29 | 0  | 8 | 0 | 2 | 0 | 1
28 | 0  | 7 | 0 | 2 | 0 | 0
0  | 15 | 0 | 4 | 0 | 1 | 0
0  | 14 | 0 | 4 | 0 | 1 | 0

The average movement of datum is 6.

Looking that Polyphase Merge Sort is more efficient.

=#
