#=

Q.

Our analysis of the Move-to-Front Heuristic assumed that the dictionary had been in use for a long time, so that the repeated accesses had left the list in a "steady state." In this problem we consider how long it takes for such a "steady state" to be reached. As in the text, assume there are n items K_1, ... , K_n with access probabilities p_1, ... , P_n. Also assume that these items are initially in random order in the list; that is, all n! orderings are equally likely.

a. Define p_t(i, j) to be the probability that K_i precedes K_j at time t (that is, after t LookUps have occurred). Thus p_0(i, j) = 1/2 for all i and j, and p_t(i, j) should be approximately equal to p(i, j) for large t. Give an exact formula for p_t(i, j).

b. The sum O_t =  Σ i!=j (p_t(i, j) - p(i, j)) describes how much more the t-th LookUp is expected to cost than the steady-state cost, due to the lingering effect of the start-up ordering of the items. Define the overwork of the heuristic to be Σ t from 0 to inf O_t; this is the total number of extra comparisons that are expected to be done over the long haul due to the ordering of the list at the beginning. Show that the overwork is at most n(n - 1)/4. (It follows that once n(n - 1) LookUps have been done, the amortized cost per LookUp of having started with the list in a random order rather than in something close to the optimal order is less than 1/4 of a comparison.)

c. Consider the particular probability distribution in which p_1 = 1 and all the other p_i are 0. (Thus K_1 is the only item that is ever accessed.) Show that the overwork of the Move-to-Front Heuristic is (n - 1)/2, but the overwork of the Transpose Heuristic is much larger, namely, (n^2 - 1)/6. (This supports the intuition that the Transpose Heuristic takes longer to reach "steady state" than the Move-to-Front Heuristic.)

A.

a.

p_t(i, j) = (1 + p_i*t) / (2 + (p_i + p_j)t)

b.

Choose i and j in n table to satisfy i < j. With combination theorem, its number of cases is n(n-1)/2.
