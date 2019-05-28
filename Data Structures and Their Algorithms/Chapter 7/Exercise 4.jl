#=

Q.

Say that a k-AVL tree, where k is a small number, is a binary search
tree in which the balance is allowed to be any number in the range
from -k to +k, for some small number k. (Ordinary AVL trees are
then 1-AVL trees.)

a. Write a recurrence relation for w_h^(k) , the maximum number of
nodes in a k-AVL tree of height h, and calculate w_h(3) h for a few
small values of h.

b. Estimate, as accurately as you can, the maximum height of any
k-AVL tree with n nodes.

c. How would you do an insertion in a k-AVL tree?

A.

a.

w_h(k) = 1 + w_(h-1)(k) + w_(h-k-1)(k) (h > k), w_h(k) = k (h <= k)

w_4(3) = 6, w_5(3) = 9, w_6(3) = 13, ...

b.

Denote H(n) the largest height of AVL tree with n nodes, H_k(n) the largest height of k-AVL tree with n nodes.
Assume that we are attempting to append skewed tree (looks like list) with k nodes to the AVL tree.
If the height of the leaves in AVL tree is same, then what we need to do is just appending the skewed tree to the AVL tree.
Thus, H_k(n+k) = H(n) + k = lg(n+1)-1+k.
Else then the height of some leaves is floor(lg(n+1)) (denote a), and that of the others is floor(lg(n+1))-1 (denote b).
If we append the skewed tree to a, then a node in resulting k-AVL has k+1 balance, which cause rotating.
Appending to b has no rotation, thus H_k(n+k) = min(H(n)) + k = floor(lg(n+1))+k.
Therefore, H_k(n) = floor(lg(n-k+1))+k-1.

c.

Insert a node like a binary search tree.
Then, split the path to rotate with points to do double rotation and apply it.
Each path fragment should be reversed when it becomes the child of another fragment.

=#
