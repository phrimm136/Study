#=

Q.

Consider a sequence of operations that starts with n singleton sets
and consists of a sequence of m <= n Union operations followed by a
sequence of n - m Find operations (with path compression). Show
that the time for the whole sequence is 0(n).

A.

Since union operation takes O(1) and time consumption of find with path
compression operation is O(log* n), which is less than 6 when n <= 2^65536,
so we can consider O(log* n) as constant time.
Therefore, m union and n-m find with compression operation takes O(n) time.

=#
