#=

Q.

In the analysis of the linear-time median algorithm, show that the
inequality (2) is satisfied whenever k ≥ 40. Is 40 the smallest number
with this property?

A.

when k = 40, 3*ceil(floor(k/5)/2) = 3*4 = 12 and ceil(k/4) = 10,
the equation holds.
this property is satisfied with k ≥ 5, which means even with one
block we can get median.

=#
