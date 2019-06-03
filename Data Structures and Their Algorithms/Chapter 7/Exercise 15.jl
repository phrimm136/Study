#=

Q.

a. Suppose that S and T are disjoint sets, and every member of S
is smaller than every member of T. Show that if these sets are
represented by 2-3 trees, then the function Union(S, T) can be
computed in O(|(log |S| - log |T|)|) time (the absolute value of
the difference of the logarithms of the sizes of the sets).

b. Find and analyze a 2-3 tree algorithm for the operation Prefix,
where Prefix(S, x) = {y ϵ S : y <= x}.

A.

a.

If log|S| > log|T|, traverse the rightmost child of S until the height of a subtree of S is equal to that of T.
Else, traverse the leftmost child of T until the height of a subtree of T is equal to that of S.
Then add it to the right or left of subtree and the union tree will sort nodes properly.
The only instruction Union does is to traverse down the larger tree, merge them and split nodes if neccessary,
which takes O(|(log |S| - log |T|)|), O(1), O(1) time, respectively.
Thus, Union takes O(|(log |S| - log |T|)|) time.

b.

Until the left key is smaller than or equal to x, the function tracks the leftmost child.
If we find a key that meets the condition, access it and evaluate the right key if it meets the condition.
If it does, recur the above statement for all children, else for the children except for the right one.

P(S, x) = |P(S-1, x) , LK(S) > x .. 1
          |2P(S-1, x), RK(S) > x .. 2
          |3P(S-1, x), else      .. 3

=> O(n)

=#
