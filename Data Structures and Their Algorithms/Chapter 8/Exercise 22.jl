#=

Q.

Let S(n, m) represent the expected time for a successful search in a
separately chained hash table of m buckets containing n keys, not
counting the probe to get the list header. By considering separately
the case in which the key is in the first bucket or in one of the other
m - 1 buckets, show that S(n, m) is equal to
sigma k=0 to n nCk * (m-1)^(n-k)/m^n * (k/n * (k+1)/2 + (n-k)/n * S(n-k, m-1)).
Here k is the number of keys in the first bucket. Then prove by
induction on m that
S(n, m) = 1 + (n-1)/(2m)
You will want to use the identities
sigma k=0 to n nCk * p^k = (1+p)^n
sigma k=0 to n k * nCk * p^k = np(1+p)^(n-1)
sigma k=0 to n k^2 * nCk * p^k = np(1+np)(1+p)^(n-2)

A.

