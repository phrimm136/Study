#=

Q.

Let H be a universal class of hash functions from K to {O, ..., m-1},
let S be any subset of K, let x be any member of S, and let h be a
randomly chosen member of H. Show that the expected value of
|{y ∈ S: x != y but h(x) = h(y)}|
is at most |S|/m.

A.

Since the exptected value of |{h ∈ H, x,y ∈ K: h(x) = h(y)}| <= 1/m
and the number of y is |S|-1,
the expected value of |{y ∈ S: x != y but h(x) = h(y)}| < |S|/m.

=#
