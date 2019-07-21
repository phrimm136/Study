#=

Q.

a. The numbers 1, 2, ... , 2^(k-1) are merged into a single perfect
binary up-tree by a sequence of balanced Union operations, in
such a way that the leaves are numbered 1, 2, ... , 2^(k-1) from left
to right. Describe a sequence of operations that could produce
this result.

b. The operations Find(1), Find(2), ... , Find(2(k-1)) are then carried
out using path compression. What is the order of the time required
for this sequence of Find operations? (That is, the answer should
be of the form "Θ(f(k))" for some function f.)

A.

It seems that there is a typo at the first line. 2^(k-1) would be correct rather than 2^k-1.

a.

Union each two numbers from left to right, again union each two result from left to right, ...
until there is only a result from the sequence of union on a level.

b.
            x
          y
       a
   b       c
 d   e   f   g
1 2 3 4 5 6 7 8

       a
1 d  b       c
  2    e   f   g

       a
1 2 d  b     c
        e   f  g

...

=> 3 2 3 2 3 2 3 2 = 20
   4 2 3 2 4 2 3 2 4 2 3 2 4 2 3 2 = 44
   5 2 3 2 4 2 3 2 5 2 3 2 4 2 3 2 5 2 3 2 4 2 3 2 5 2 3 2 4 2 3 2 = 92

...

=> f(k) = 2*f(k-1) + 4, f(2) = 8 <=> f(k) = 3*2^k - 4 (k is the maximum depth), Θ(f(k)) = 2^k

=#
