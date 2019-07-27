#=

Q.

a. Define the right bounding path, by analogy with the given defi-
nition of left bounding path.

b. Show that it is impossible for the left and right bounding paths
to coincide up to a node, and for one bounding path to continue
while the other ends at that node.

c. Let X be a node whose key is in the range but which is not on
either bounding path, and let Y be the last node on the path from
the root to X that is on a bounding path. Show that Y is not the
last node on the bounding path.

A.

a.

Let T be a binary search tree and let L and U be the limits of
a search range. The right bounding path is the sequence of nodes 
R_0, ... , R_l defined as follows.
R_0 is the root of T; and for any i >= 0,
1. if R >= Key(R_i), then
  a. if RC(R_i) != null, then R_(i+1) = RC(R_i);
  b. if RC(R_i) = null but LC(R_i) != null, then R_(i+1) = LC(R_i);
  c. if RC(R_i) = LC(R_i) = null, then l = i (that is, R_i is the last node on the path);
2. if Key(R_i) > R, then
  a. if LC(R_i) != null, then R_(i+1) = LC(R_i);
  b. if LC(R_i) = null, then l = i.
Thus the right bounding path delimits the right edge of the part of the tree in
which it makes sense to search for an element of the range. 

b.

Since we are searching in range, it is reasonable that L < U.
When L <= K <= U, if one of children of K is null,
then they proceed to non-null child;
if K is leaf, then the paths end simultaneously;
otherwise, they proceed left and right child of K, respectively.
When K < L < U, if right child of K is null, the paths stop,
otherwise they proceed to the right child of K.
When L < U < K, if left child of K is null, the paths stop,
otherwise they proceed to the left child of K.

There are no case above that a path overrides another one,
so it's impossible that a path is an extension of another one.

c.

Since the last node of bounding path has no children, but
X is greater (left path) or less (right path) than Y,
which means that Y should have children.
So there is a contradiction, and Y can't be the last node of a path.

=#
