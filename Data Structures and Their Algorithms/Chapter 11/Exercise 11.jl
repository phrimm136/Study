#=

Q.

Algorithm 11.4 and Algorithm 11.5 provide an O(n log n) worst-case
sorting algorithm. This problem concerns constant-factor improve-
ments in the running time of Heap Sort that can be achieved by
reducing the number of comparisons of data items. The key to these
improvements is in the implementation of Heapify, which inserts a
single item into a heap.

a. Show that a careful recoding of Algorithm 11.5 can reduce the
number of data item comparisons to about 2n lg n in the worst
case.

b. Show that this number can be further reduced to about n lg n by
first identifying the path on which the insertion should take place,
then finding, by binary search, the point on the path where the
insertion should occur, and only then moving the data items that
need to be moved to open up the slot for the item being inserted.

A.

a.

=#

function heapify(A, i, j)
    if LC(j) ≥ i
        if A[RC(j)] < A[j] && A[RC(j)] ≤ A[LC(j)]
            swap(A[j], A[RC(j)])
            heapify(A, i, RC(j))
        elseif A[LC[j]] < A[j]
            swap(A[j], A[LC(j)])
            heapify(A, i, LC(j))
        end
    end
end

#=

b.
