#=

Q.

This problem explores the use of the Move-to-Front Heuristic with tables.

a. Suppose that the list is stored as a table K[O..n-1], that accessing (reading or storing) any element K[i] takes time α, and that the number of such accesses is the main determiner of the speed of the heuristic when implemented for tables. Derive an expression for the expected time to perform a successful search if the Move-to-Front Heuristic is in use.

b. Suppose it is known that every search will be successful; what is the expected time for a search? (Hint: Some preparation for the movement to front can take place as the table is searched.)

A.

a.

f(c) = |2α*C_MTF
       |α*n (not in the table; search failure)

then

expected time = (sigma i from 1 to n f(i)) / n

b.

Since the search always succeeds, make a temp variable and push forward each variable with it until the search succeeds, and assign the temp value to the first of table. With this preparation, we can reduce the access time by half plus one.
So the expected time is α*(C_MTF + 1).

=#
