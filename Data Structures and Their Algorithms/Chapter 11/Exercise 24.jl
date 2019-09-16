#=

Q.

The following sorting algorithm, called distributive partitioning,
might be viewed as a cross between Quick Sort and Bucket Sort.
It employs a partitioning step somewhat like that of Quick Sort, but
with the pivot element chosen as the exact median. Since the linear-
time median algorithm can be used (§ 11.8), this guarantees O(n log n)
time complexity in the worst case. It also avoids deep recursion in
the expected case by distributing the items to be sorted into buck-
ets according to their key values, using a calculation like that in
Interpolation Search; in fact the expected performance is linear if the
data are uniformly distributed. Assume that the keys are numerical
values, and that the table to be sorted contains n items. Then the
algorithm proceeds as follows.

1. Find the minimum, median, and maximum items in the table; call
these key values a, b, and c.

2. Divide each of the ranges from a to b, and from b to c, into floor(n/2)
intervals of equal length, and distribute the items to be sorted into
buckets corresponding to these intervals. The item with key K
goes in bucket number
floor(((K-a)/(b-a)) * (n/2)), if K < b;
floor(((K-b)/(c-b)) * (n/2)) + floor(n/2), if b ≤ K < c;
2*floor(n) - 1, if K = c.

3. The buckets are scanned in order of increasing bucket number.
If a bucket contains no element, it is passed over; if it contains
one element, that element is appended to the sorted table; and if it
contains more than one element, the algorithm is called recursively
to sort the bucket.

a. Give examples of tables of 16 numbers that result in the best- and
worst-case performance of this algorithm.

b. Show that this algorithm takes time O(n log n) in the worst case.

c. Explain what data structures are needed to implement this algo-
rithm efficiently. How much extra space is needed in addition to
the input table?

d. How can the assertion that this algorithm has expected linear-time
performance be consistent with the Information-Theoretic Lower
Bound?

A.

a.

1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16

bucket
0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
-----------------------------------------------
1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16

=> each element in the buckets is appended directly,
the above table is the best case.

Ex means 10^x.

E1 E2 E3 E4 E5 E6 E7 E8 E9 E10 E11 E12 E13 E14 E15 E16

bucket
0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
------------------------------------------------
E1                      E8                   E15
..                      ..
E7                      E14

...

=> each loop devides elements into two long parts and an element,
(because 0, floor(n/2), and n-1 have at least an elements)
the above table is the worst case.

b.

As described above, breaking the elements down into two long parts
and one element is the worst split. iterting this split constructs
the worst case, which can be denoted as
T(n) = T(floor(n/2)) + T(floor(n/2)+1) + T(1).
After generalization, we get T(n) ∈ O(n logn).

c.

Use hash table with separate chaining.
We need three integer spaces for a,b, and  c and a space for
hashtable with n+N. while iterating, we can reuse it because
the required space for hash table with sub-elements is less than
the initial one.

d.

Since distribution of both the assertion and the Information-Theoretic
Lower Bound can be denoted as decision tree,
one that each node has at most n branches, the other that has only two,
They are in common.
