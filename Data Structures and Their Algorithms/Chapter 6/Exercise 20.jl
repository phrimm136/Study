#=

Q.

This problem concerns the (rather fanciful) question of how quickly one can search an infinite sorted table. Imagine that the infinite table A[1 .. inf] is sorted, so that A[i] < A[i+1] for every i, and we want to find the unknown position n of an item K = A[n]. The complexity measure will be the number of comparisons performed. The simplest imaginable method is the order-0 algorithm: Start at position 1 and then search positions 2, 3, ... sequentially until reaching A[n] = K. Clearly this method uses n comparisons.

a. An alternative, called the order-1 algorithm, first tries to find the smallest integer k such that 2^k > n, by probing positions 1, 2, 4, 8, .... When such a k has been determined, the exact value of n is found by binary search. Show that the order-i algorithm takes about 21gn comparisons at worst.

b. Notice that the first stage of the order-1 algorithm is actually a search for an unknown value of k by trying k = 0 first, then k = 1, then k = 2, ...; in other words, k is located by the order-0 algorithm. Show that an order-2 algorithm can be defined by replacing the first stage of the order-1 algorithm by a search for k using the order-1 algorithm. How many comparisons does the order-2 algorithm use?

c. Generalize the method of part (b) as much as possible to reduce the number of comparisons needed.

A.

a.

2^k > n <=> k > lgn, so finding k always takes lgn comparisons.
Binary search on 2^(k-1) and 2^k also takes lgn comparisons in worst case.
Binary search is done after finding k, so we just add them and the total comparision in worst case is 2lgn.

b.

Applying the order-1 algorithm on k. j > 2^k >2^2^n, and binary search will be applied twice for k and n, respectively.
So the comparisons is lgn + (lg(lgn)).

c.

Iterate the order-1 algorithm on the result of the order-1 algorithm until 2^2^2^...^1 > n (k times), and then apply binary search k times.
