#=

Q.

In Algorithm 6.10 on page 203, where and how should the p(j, k) be
calculate?

A.

Take two variables(m_1, m_2) to memoize.

When entering the outer iteration, assign p_1 to m_1.
In outer iteration, add p_d to m_1.
When entering the inner iteration, assign m_1 to m_2.
In inner iteration, add p_(j+d)-p_j to m_2.

=#
