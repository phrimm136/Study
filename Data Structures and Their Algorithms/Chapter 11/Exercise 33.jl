#=

Q.

Suppose that a table of length n contains k distinct elements x_1, ...,
x_k, where x_i occurs c_i times. (Therefore n = ∑ n=1:k C_i.) Prove that
any comparison-based sorting algorithm must use
 Ω(log n! / (c_1!c_2!...c_k!))
comparisons in the worst case to sort the list. (The algorithm does not
know ahead of time the number and distribution of the duplicates.)

A.

Because the number of permutation of n elements that k distinct elements
are duplicated is (n! / (c_1c_2!...c_k!)), (have a look at a combinatorics book.)
with Information-Theoric Lower Bound Theorem, 2^(c(n)) ≥ (n! / (c_1!c_2!...c_k!))
then c(n) >= lg(n! / (c_1!c_2!...c_k!)) ∈ Ω(lg(n! / (c_1!c_2!...c_k!))),

=#
