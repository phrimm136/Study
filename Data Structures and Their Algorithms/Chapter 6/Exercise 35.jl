#=

Q.

This problem concerns the expected-case analysis of the construction
of binary search trees.

a. Show that if each key is equally likely to stand in any of the m+1
possible positions relative to the m keys inserted before it, then
all n! permutations of the keys are equally likely to be the order
in which the keys are inserted.

b. Show that the conditions of part (a) are different from saying that
all the binary search trees are equally probable. This idea can be
refuted by considering the permutations ofjust three keys.

A.

a.

Use induction.
When n=1, its definitely true.
If the statement is true when n=k, then there are n+1 equally possible positions to put into the n permutations.
So the number of distinct cases is (n+1)*n! = (n+1)!, which is the number of cases of n+1 permutations,
and the statement is true when n=k+1.
Thus, the statement is true.

b.

when a < b < c,

a b c    a c b    b a c    b c a    c a b    c b a
  a        a        b        b        c        c
    b        c    a   c    a   c    a        b
     c      b                        b      a

so n permutations don't make equally probable binary search trees.

=#
