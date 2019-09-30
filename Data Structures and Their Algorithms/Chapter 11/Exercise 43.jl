#=

Q.

Prove that replacement selection produces a single sorted run if and
only if no item in the input is preceded by more than b - 1 items that
ought to follow it, where b is the size of the buffer.

A.

Assume that there is an item preceding by b items (there are b+1 items).
Then, if a smallest item is not in the buffer, it consists another buffer,
producing a next run.
Thus, we can't assure that replacement selection produces a single sorted run
with more than n items.

=#
