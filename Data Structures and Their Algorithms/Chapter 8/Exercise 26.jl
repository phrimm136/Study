#=

Q.

Assume that every effort is made to keep the directory as small as
possible. What are the minimum and maximum number of leaf pages
of an extended hash table of depth D?

A.

If the table is empty, the number of pages would be 0.
With one binary key, if we consider the depth zero, there would be one leaf with no prefix.
So, the minimum number is 0 when D=0 and 1 otherwise.
The maximum number is 2^D when D>0, and 0 when D=0.

=#
