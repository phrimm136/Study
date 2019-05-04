#=

Q.

An efficient way of calculating expression (1) on page 135 is suggested by Homer's rule for evaluating polynomial expressions, which says that
a_nx^n + a_(n-1)x^(n-1) + ... + a_1x + ao = ao + x(a_1 + x(a_2 + ... +x(a_n) ...)).
The same idea can be applied here, yielding
X + L * (j_d - l_d + s_d * (j_(d-1) - l_(d-1) + s_(d-1) * (j_(d-2) - l_(d-2) + ... s_2 * (j_1 - l_1)... )))
as the address of element X[j_1, j_2, ... , j_d].
Show how to arrange this computation so that Access can be implemented in only about 2d operations.

A.

Because L(l_d + s_d(l_(d-1) + s_(d-1)(l_(d-2) + ... + s_2(l_1) ... ))) is eqaul to M_1*l_1 + M_2*l_2 + ... M_d*l_d = X_0,
 we can arrange this computation to X - X_0 + L(j_d + s_d(j_(d-1) + s_(d-1)(l_(d-2) + ... + s_2(l_1) ... ))) which takes only about 2d operations.

=#
