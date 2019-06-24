#=

Q.

Here is the lazy man's approach to maintaining a balanced tree representation
of a set. Use ordinary binary tree insertion and do no
rebalancing at all until the tree gets too badly out of balance; then
completely reconstruct the tree to be as balanced as possible. Various
criteria can be used to determine when the tree is badly out of
balance; one that works is to keep track of the actual internal path
length in the tree IT and the optimal internal path length OT (which
depends only on the number of nodes), and to restructure whenever
I_T > δ0_T or I_T < (1/δ)O_T, where δ > 1 is a constant parameter of
the algorithm governing how badly out of balance we are willing to
allow the tree to get.

a. Write the restructuring algorithm.

b. How can the quantities I_T and O_T be determined?

c. Show that the lazy man's method takes linear worst-case time but
logarithmic amortized time for any insertion, deletion, or search.

A.

a.

=#

function linearlize(T, DL) # DL is doubly linked list using sentinel
    if T == nothing
        return
    else
        insert(DL, T.item)
        linearlize(T.left, DL)
        linearlize(T.right, DL)
    end
end

function reconstruct(T)
    DL{DList}
    linearlize(T, DL)

    f = DL.next
    b = DL.prev

    while (f != b && f.prev != b && f.prev.prev.prev != b.next.next)
        splay(T, f.item)
        splay(T, b.item)
    end
end

#=

b.

I_T: current height
O_T: lg n

c.

In reconstruction, linearlization and poping out 
