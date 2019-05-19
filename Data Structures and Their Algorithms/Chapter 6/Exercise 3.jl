#=

Q.

Suppose that the keys in a list are of two kinds: those accessed frequently and those accessed rarely. For example, suppose that a list of 2n keys contains n keys each accessed with probability 0.99/n and n keys each accessed with probability 0.01/n.
(Of course, initially we don't know which keys are in each class!)
 What is the expected search time for an item if the Move-to-Front Heuristic is used for a long time?

A.

C_MTF = 1 + 2(sigma i<j p_i*p_j/(p_i + p_j)). = 1 + (n-1)^2/2 * (99/(10000n^2))/(1/n) + (n-1)^2/4 * (9801/(10000n^2))/(198/(100n)) + (n-1)^2/4 * (1/(10000n^2))/(2/(100n))
      = 1 + 2599(n-1)^2/(20000n)
Since comparing and moving to first takes constant time, the expected search time is c(1+2599(n-1)^2/(20000n)).

=#
