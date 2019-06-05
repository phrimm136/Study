#=

Q.

Suppose that a B-tree of order b grows only through addition of
records (no deletions). What is the expected storage utilization (averaged
over all values of n, the number of items in the tree)? What
would be the expected storage utilization if storage is kept at least
66% full by the strategy described on page 242?

A.

The storage utilization is distributed unbiasedely from a/(2a-1) to (2a-1)/(2a-1),
so the expected storage utilization is 75%.
Similarly, with 3-to-2(page 242) algorithm, the expected sotrage utilization is 83%.

=#
