#=

Q.

When you buy a ticket in the State Lottery, you choose six different
numbers between 1 and 36. The lottery officials keep a dictionary
keyed on the set of six numbers chosen on each ticket. After the
officials pick the winning numbers, they access this dictionary to
identify the winning ticket or tickets, if any. Since millions of tickets
are sold, the officials have decided to keep the dictionary in external
storage with a directory in an internal hash table. Their computer
consultant, S. L. Ow, has recommended that they use the hash function
h(x_1, X_2, X_3, X_4, X_5, X_6) = (X_1 + X_2 + X_3 + X_4 + X_5 + X_6) mod m,
where m is the number of external buckets in which the records will
be stored. Give a critique of this recommendation, and suggest a
better alternative.

A.

With that method, we can't distinguish permutations of a set.
To distinguish a set from its permutations, 
h(x_1, X_2, X_3, X_4, X_5, X_6) = (X_1 * m^5 + X_2 * m^4 + X_3 * m^3 + X_4 * m^2 + X_5 * m + X_6) mod m
would be better.

=#
