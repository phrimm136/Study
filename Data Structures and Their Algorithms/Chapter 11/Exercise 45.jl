#=

Q.

This problem concerns the length of the first run that is produced
when replacement selection is used with an initially empty buffer of
size b and the input is random.

a. Explain on an intuitive level why the expected length of the first
run is less than the expected length of subsequent runs.

b. Let a be the expected length of the first run if the buffer were of
size one. That is, a is the expected length of the initial monoton-
ically increasing sequence of items in a random permutation of a
very large collection of items. Show that the expected length of
the first run when a buffer of size b is used is αb.

c. Show that α = e-1. (Hint: This can be done by count-
ing permutations of various kinds and using the infinite series
e = ∑ i in [0, ∞) 1/i!, or by using the snowplow metaphor and a bit of
differential calculus.)

A.

a.

Since the buffer is initially empty and subsequently not,
the buffer in the first run can be exhausted earlier than in the other runs.

b.

Assuming that buffer with b size is constitued with b times one-length buffer,
then we can say that those buffers have α length first runs for each.
By concatenating, we can get αb length first run.

c.

With n length input, expected value of n-length first run is (n*1)/n!,
that of (n-1)-length is ((n-1)^2)/n!, and of (n-2)-length is (n-2)^2(n-3), ...
e-1 = lim n->∞ ∑ i in [1, n) 1/i! = lim n->∞ (n! + (n(n-1)...2) + ... + 1) / n!
    = lim n->∞ (n(n-1) + (n-1)(n-2) + ... + 2*1) / n!
