#=

Q.

In Algorithm 8.2 on page 279, explain exactly why the test in the first
line of the Insert algorithm tests Size(P) = m - 1, and what would
go wrong if the test were Size(P) = m instead.

A.

There could be an infinite loop while inserting, so the max size should be m-1.
