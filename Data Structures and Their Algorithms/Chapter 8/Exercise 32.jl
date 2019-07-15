#=

Q.

Let N = 31 and m = 5 and consider the universal class of hash
functions defined in the Theorem.

a. Exactly how many pairs of distinct numbers <q, r> are there such
that 0 <= q,r < N and q ≡ r (mod m)?

b. What is the exact maximum probability, over all pairs of distinct
keys x, y, that a randomly chosen hash function h_(a,b) will cause
x and y to collide?

A.

a.

number with modulo 0: 0, 5, 10, 15, 20, 25, 30
number with modulo 1: 1, 6, 11, 16, 21, 26
number with modulo 2: 2, 7, 12, 17, 22, 27
number with modulo 3: 3, 8, 13, 18, 23, 28
number with modulo 4: 4, 9, 14, 19, 24, 29

number of pairs <q, r> that 0 <= q,r < N and q ≡ r (mod m): 7*6/2 + 4*6*5/2 = 81

b.

number of pairs <q, r> that 0 <= q,r < N: 31*30/2 = 465
maximum probability: 81/465 = 27/155 < 1/5

=#
