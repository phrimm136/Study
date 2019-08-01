; φ = (1 + √5) / 2, ψ = (1 - √5) / 2 = 1 - φ = -1 / φ
;    x ^ 2 = x + 1 <=> x ^ n = x ^ (n - 1) + x ^ (n - 2)
; => φ ^ n = φ ^ (n - 1) + φ ^ (n - 2) and ψ ^ n = ψ ^ (n - 1) + ψ ^ (n - 2)
; U(n) = aφ ^ n + bψ ^ n = aφ ^ (n - 1) + aφ ^ (n - 2) + bψ ^ (n - 1) + bψ ^ (n - 2) = U(n-1) + U(n-2)
; If a and b are chosen so that U(0) = 0 and U(1) = 1 then the resulting sequence U(n) must be the Fibonacci sequence.
; This is the same as requiring a and b satisfy the system of equations
; a + b = 0, φa + ψb = 1
; which has solution
; a = 1 / (φ - ψ) = 1 / √5, b = -a
; producing the required formula
; Fib(n) = (φ ^ n - ψ ^ n) / √5
; which is approximate of φ ^ n / √5
; Since φ ^ n / √5 < 1 / 2 for all n >= 0, the number Fib(n) is the closest integer to φ ^ n / √5.