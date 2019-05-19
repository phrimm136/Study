#=

Q.

Suppose we are given two key values K_1 and K_2, where K_1 <= K_2, and an ordered table T[O .. n-1]. We want to find the range within T corresponding to the lower and upper limits K_1 and K_2, that is, we want to find the minimum i and maximum j such that K_1 <= T[i] and T[j] <= K_2. (It is possible that no such i or j might exist.)
According to the Expected Binary Search Theorem this problem can be solved by doing binary searches for K_1 and K_2 at an expected cost of about 2*floor(lg n) comparisons. Devise and analyze a better method.

A.

Check if K_1 and/or K_2 are not in the array (K_1 > T[n-1] and K_2 < T[0]). If this condition is satisfied, then we don't need to find i and/or j and can reduce about floor(lg n) comparisons for each.

=#
