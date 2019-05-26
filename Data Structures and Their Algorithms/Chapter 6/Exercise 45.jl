#=

Q.

Show that the inequality for B(n) given on page 205 implies that the
balancing heuristic runs in linear time.

A.

When n=1, B(1) = c*(1 + lg1) + B(0) + B(0) = c (B(0) = 0)
Assume that B(k) <= 2ck when n=k.
When n=k+1, B(k+1) = max(1<=l<=k+1)(c*(1 + lg(min(l, k-l+2))) + B(l-1) + B(k+1-l))
Since B(l-1) + B(k+1-l) <= 2ck and max(min(l, k-l+2)) <= (k+2)/2, B(k+1) <= c*(1 + lg((k+2)/2)) + 2ck
