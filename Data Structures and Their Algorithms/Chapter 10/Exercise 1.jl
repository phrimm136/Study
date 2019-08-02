#=

Q.

As explained on page 345, the reference count method requires that
the assignment P <- Q be preceded by (i) decrementing the count of
the cell P points to, (ii) releasing that cell if the count is zero, and
(iii) incrementing the count of the cell that Q points to.

a. Suppose that P and Q are the same variable, that is, the assign-
ment is P <- P. What can go wrong with the procedure (i)-(iii),
and how can it be repaired?

b. Suppose that P and Q are different variables but that, before the
assignment, P and Q point to the same cell. Could the sequence
(i)-(iii) fail in that case? If so, how should it be recoded?

A.

a.

If P is the only pointer points its cell, then it is released at (ii)
when its count is one and P <- P.
To fix this malfunction, disable (ii) when P <- P.

b.

Since reference counter in this case is at least 2, so there are no
chances to mis-release a cell.

=#
