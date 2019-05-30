#=

Q.

a. Describe an implementation of Union(S, T), where S and T are
represented as AVL trees, that runs in time O(|S|+|T|).

b. Show that if every key in S is less than every key in T, then
Union of AVL trees can be computed in time O(log|S|+log|T|).
Estimate the exact number of rotations required in the worst case.

A.

a.

Merge list of keys of each S and T, and make a AVL tree with elements from both ends.
By doing this, each element is inserted to the root of the tree, and also rotation is done.
Since the time consumtion of rotation is propotional to the depth to rotate, it takes constant time.
Traversal and merger are done in time O(n) and O(n+m), respectively, so the union function runs in time O(|S|+|T|).

b.

Find the largest key of S (LS) and the least key of T (lT), each takes time O(log|S|) and O(log|T|), respectively.
If LS < lT, then every key in S is less than every key in T, so all we should do for union is making lT the root of the new node.
Deleting lT takes time O(log|T|), so the union can be computed in time O(log|S|+log|T|).
The number of rotations required in the worst case is log|T|, every node from root to lT needs rotation while deleting lT.

=#
