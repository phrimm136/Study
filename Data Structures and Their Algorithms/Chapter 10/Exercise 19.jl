#=

Q.

Show that without a roving pointer the first fit strategy searches half
the free list on average. What assumptions lead to this conclusion?

A.

Without rover first fit strategy should search from the front of the pool,
so the average search time is ∑ 0:n / n = (n+1)/2.
If we consider requested size, the search will be ended eariler, so the
average will be less than half. But I assumed that every search traverses
to the end regardless of the requested size.

=#
