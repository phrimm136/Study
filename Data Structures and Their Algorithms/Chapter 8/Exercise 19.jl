#=

Q.

The Quicksearch Center is hired to design a data structure for storing
10,000 names. The client informs the Center that one-quarter of the
names will account for three-quarters of the successful searches, and
the remaining three-quarters of the names will account for only onequarter
of the successful searches. (There will also be searches for
names not in the data structure at all.) The Center first decides to
store all 10,000 names in an open-addressed hash table of size 12,000
using double hashing. But then one of its employees, C. Wizard,
suggest splitting the 12,000 locations into two tables, a small table
of size 3000 to hold the high-frequency quarter of the names and a
larger table of size 9000 to hold the low-frequency three-quarters.

a. Is Wizard's suggestion a good one? Analyze both proposals with
respect to their performance in the case of both successful and
unsuccessful searches.

b. Repeat the analysis, on the assumption that the Center always
implements ordered hashing.

c. Suppose that the proportions in the statement of the problem are
not 1/4 and 3/4 but p and 1 - p, where 0 < p < 1. For what
values of p, if any, would it make sense to isolate the fraction p
of the most frequently occurring keys in a subtable consisting of
the fraction p of the available memory?

A.

a.

With split, successful search takes S_4000*3/4 + U_4000*3/4*S_8000/4 = 9/10ln6
and unsuccessful search takes U_4000*3/4 + U_8000 = 10.5.
Without split, successful search takes S_10000 = 6/5ln6
and unsuccessful search takes U_10000 = 6.
So splitting is efficient in successful searches.

b.

With split, (un)successful search takes 9/10ln6
one without split 6/5ln6.
Also in unsuccessful search splitting is efficient.

c.

With split, successful search takes p*ln(1/(1-a))/a + p/(1-a) * (1-p)*ln(1/a)/(1-a)
and unsuccessful search takes (1+p)/(1-a).
Without split, successful search takes ln(1/(1-a))/a,
and unsuccessful search takes 1/(1-a).
Isolating always makes unsuccessful search slow
and in successful search (1-p) * (ln(1/(1-a))/a - p*ln(1/a)/(1-a)^2), any p value can make isolation efficient.

=#
