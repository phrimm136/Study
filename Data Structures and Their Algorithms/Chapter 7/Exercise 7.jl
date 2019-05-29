#=

Q.

This problem establishes several relations used in the proof of the
AVL Tree Height Theorem.

a. Show that w_h = F_(h+3) - 1.

b. Show that F_i > Φ^i/(√5 - 1) for every i.

c. Show that 2√5/(Φ^3 - √5) = √5.

A.

a.

                           w_0 = 1, w_1 = 2, w_2 = 4, w_3 = 7, w_4 = 12, ...
F_0 = 0, F_1 = 1, F_2 = 1, F_3 = 2, F_4 = 3, F_5 = 5, F_6 = 8, F_7 = 13, ...

Use induction.
When n=0, w_0 = 1, F_3 - 1 = 2 - 1 = 1, true.
Assuming the statement is true when n<=k, add w_(h-1) + 1 to both side then w_(h+1) = F_(h+3) + w_(h-1).
Since w_(h-1) = F_(h+2) - 1, F_(h+3) + w_(h-1) = F_(h+3) + F_(h+2) - 1 = F_(h+4) - 1.
Thus w_(h+1) = F_(h+4) - 1, the statement is true.
Therefore w_h = F_(h+3) - 1.

b.

Let Φ and ψ be solutions of x^2 = x + 1, then Φ = (1+√5)/2, ψ=(1-√5)/2.
So Φ^2 = Φ + 1 <=> Φ^n = Φ^(n-1) + Φ^(n-2) , ψ^2 = ψ + 1 <=> ψ^n = ψ^(n-1) + ψ^(n-2).
Denote U_n = aΦ^n + bψ^n = aΦ^(n-1) + bψ^(n-1) + aΦ^(n-2) + bψ^(n-2) = U_(n-1) + U_(n-2).
If a and b are chosen that U_0 = 0 and U_1 = 1, U_n must be the fibonacci sequence.
then a + b = 0, aΦ + bψ = 1 <=> a = 1/(Φ - ψ) = 1/√5, b = -1/(Φ - ψ) = -1/√5.
So U_n = F_n = (Φ^n - ψ^n)/√5.
Since ψ^n/√5 < 1/2, F_n = Φ^n/√5 - ψ^n/√5 > Φ^n/√5 - 1/2 > Φ^n/√5 - 1.

c.

Φ^3-√5 = 2+√5-√5 = 2, so 2√5/(Φ^3-√5) = √5.

=#
