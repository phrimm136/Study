#=

Q.

Starting with a singleton set S_i for each item i, where 1 <= i <= 10,
show the forest of up-trees that results after each of the follow-
ing operations, if balanced union and path compression are used:
A <- Union(S_1, S_2); B <- Union(A, S_3); C <- Union(S_4, B); D <-
Union(S_5, S_6); E <- Union(D, S_7); F <- Union(C, E); Find(7).

A.

             F        8      9      10
           /   \
          C     E
         / \   / \
        B   4 D   7
       / \   / \
      A   3 5   6
     / \
    1   2

Find(7) = F

=#
