#=

Q.

Show that if the increments for Shell Sort are defined by the recursion
  h_1 = 1
  h_(i+1) = 3h_i + 1,
then hi = (3^i-1)/2 and the index of the last increment that is less
than n is t = floor(log_3(2n+1)).

A.

With generating function H(x) = ∑ h_n*x^n = 1/2(1/(1-3x)-1/(1-x)),
h_(i+1) = (3^n-1)/2

If we set M as the largest index of d*h_t less than n, then M = (3^t-1)/2,
t = log_3(2M+1) = floor(log_3(2n+1)).

=#
