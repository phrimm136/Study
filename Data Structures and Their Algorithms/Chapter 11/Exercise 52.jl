#=

Q.

The mode of a table is the item that occurs most frequently; for
example, the mode of 4, 5, 5, 3, 5, 1, 2, 4 is 5.

a. Show how to find the mode of a sorted table in linear time.

b. Show how to find the mode of a table in time O(n log(n/m)),
where n is the size of the table and m is the number of times
the mode occurs. (Hint: Maintain two collections, S and T. S
contains items together with exact counts of their frequency in
the input. T contains "disjoint multisets" of items; that is, each
member of T is a collection of input items, possibly containing
duplicates; but no member of a collection in T belongs either
to S or to any other of the collections in T. Initially S is empty
and T contains just one collection, namely, the entire input table.
Repeatedly subdivide the largest collection in T and move its
median to S.)

A.

a.

Put all distinct elements into hash table with their occurance
and pick up the most frequent one.

b.
