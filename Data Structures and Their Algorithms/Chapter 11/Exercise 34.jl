#=

Q.

Show that 2n-1 comparisons are both sufficient and necessary to
merge two sorted lists A_0, ..., A_(n-1) and B_0, ..., B(n-1). (Hint for
the lower bound: Show that if B_i < A_i for each i and A_i < B_(i+1) for
each i < n-1, then each of the comparisons B_i :: A_i and A_i :: B_(i+1),
must actually be made.)

A.

if B_i < A_i for each i and A_i < B_(i+1) for each i < n-1,
then B_(i+1) < A_(i+1) for each i and A_(i+1) < B_(i+2)
for all i by mathmatical induction.
Since there are two comparisons for each element except to the
first element of the merged list (one comparision),
2n-1 comparisons are needed for merge.
Conversely, with 2n-1 comparisons, we can map ith element to
i, (i+1)th elements of the counterpart(Also excepting the first one.)

=#
