#=

Q.

Sam needs a data structure for searching 10,000 keys, but he knows
that 80% of the searches for keys that are actually present involve
only 20% of the keys. He decides to separate these 2000 keys into
one ordered table, and keep the other 8000 keys in a separate table.
To find a key he'll look in the small table first, using binary search,
before looking in the big table using the same algorithm.

a. How does Sam's algorithm compare to binary search of a single
table of size 10,000 in the worst case?

b. How does Sam's method compare to searching asingle table in
the expected case for successful searches?

c. How do the methods compare in terms of expected performance
on unsuccessful searches?

d. What do you think of Sam's algorithm? Would any change to the
80%-20% division alter your opinion?

A.

a.

The worst case of Sam's algorithm = floor(lg2000 + 1) + floor(lg8000 + 1) = 24 (search failure)
The worst case of the normal algorithm = floor(lg10000 + 1) = 14 (search failure)
So the Sam's algorithm is worse than the normal in the worst case.

b.

The expected case is that a key is in 2000 keys;
The expected case of Sam's method <= 4/5 * 11 + 1/5 * 24 = 13.6
The expected case of the normal method <= 14
So the Sam's algorithm is slightly better.

c.

It is same as small problem a.

d.

It is slight faster with 20% of the keys which takes 80% of the searchesand slower with the others, but I think it is reasonable to choose since the searches for the major keys become faster.

=#
