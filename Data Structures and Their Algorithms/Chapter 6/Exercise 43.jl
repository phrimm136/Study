#=

Q.

As in Algorithm 6.10, let K_1, ... , K_n be keys to be sought with
probabilities p_1, ... , p_n, where each p_i > 0 and Σp_i = 1. Let
r[j, k], where 1 <= j <= k <= n, be the root of the optimal binary
search tree for the keys K_j, ... , K_k.

a. Show that r[j, k-1] <= r[j, k] <= r[j+1, k] whenever 1 <= j <
k <= n. Intuitively, this says that adding a new key at the right
end of a sequence cannot cause the root of the optimal search tree
to move to the left in the sequence, and similarly if the key is
added to the left end of the sequence. (Hint: Use induction on
k-j.)

b. Show that if these bounds are used to limit the search for r[j, k]
in Algorithm 6.10, then for each value of d the time to execute
the "for j ... " loop is O(n^2), so that Algorithm 6.10 so modified
runs in time O(n^2). (Hint: It will not work to get a single bound
for the body of the "for j ... " loop, and then multiply it by n.
Instead, the lengths of the ranges that must be searched for all
values of j must be added together.)

A.

a.

When k-j = 1, r[j, k-1] = r[j, j] = K_j, r[j, k] = K_j or K_(j+1), r[j+1, k] = r[j+1, j+1] = K_(j+1), true.
Assume that the statement is true when k-j = m.
When k-j = m+1, there are r[j, j+m], r[j, j+m+1], r[j+1, j+m+1].
At r[j, j+m], r[j, j+m] + K_(m+1), r[j+1, j+m] + K_(m+1),

