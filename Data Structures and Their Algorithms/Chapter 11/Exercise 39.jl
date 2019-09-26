#=

Q.

Consider Polyphase Merge Sort with three tapes and with r = 9 runs.
Four empty runs must be introduced to bring the number of runs up
to the next Fibonacci number. Investigate the consequences of

a. putting two empty runs on each of the initially nonempty tapes;

b. putting all four empty runs on one of those tapes.

A.

a.

a 0 1 2 3 4 | 5  x  x  | 056 17x | 28x   |          | 012345678xxxx
b 6 7 8 x x |          |         | 0356x | 147xx    |
c           | 06 17 28 | 3x  4x  |       | 023568xx |

b.

a 0 1 2 3 x | x  x  x  | 04x 15x | 26x   |          | 012345678xxxx
b 4 5 6 7 8 |          |         | 0347x | 158xx    |
c           | 04 15 26 | 37  8x  |       | 023467xx |

=#
