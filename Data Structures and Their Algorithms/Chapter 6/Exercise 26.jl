#=

Q.

Insert the following keys into an initially empty skip list: 055, 032,
132, 200, 861, 823, 937, 916, 524. Assume that MaxLevel = 3
and that the following sequence of bits is returned by the random-
number generator (that is, the test "Random() < 1/2" is false or true
depending on whether the bit is 0 or 1): 01011100110000111110....

A.

item   level (random)

055    1
032    2
132    2
200    0
861    1
823    3
937    1
916    1
524    2


3                       x               x
2   x       x       x   x               x
1   x   x   x       x   x   x   x   x   x
0   x   x   x   x   x   x   x   x   x   x
   032 055 132 200 524 823 861 916 937 inf

=#
