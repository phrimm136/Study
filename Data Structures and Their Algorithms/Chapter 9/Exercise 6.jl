#=

Q.

Another variant of the heap data structure that solves Problem 5 is
called a deap ("double-ended heap"). A deap is like a heap except
that (1) no record is at the root; (2) the left subtree of the root is a
heap arranged so that the minimal element is at the top and each node
has key less than or equal to those of its children; (3) the right subtree
of the root is a heap arranged so that the maximal element is at the top
and each node has key greater than or equal to those of its children;
and (4) each leaf of the "min" heap is less than the corresponding
leaf of the "max" heap, where the node "corresponding" to a leaf N
of the left subtree is the leaf in the same position as N in the right
subtree, if it exists, and is otherwise the node in the same position as
the parent of N. Show that there are algorithms for this data structure
that implement the same operations as those of Problem 5 in the same
time bounds.

A.

=#

function create(A)
    h = heap()
    h["table"] = H = deepcopy(A)
    h["size"] = N = size(A)[1]

    push!(h["table"], 0)
    for i=N:-1:1
        A[i+1] = A[i]
    end

    for i=N+1:-1:4 # do not compare when pointing maximum or minimum node
        if round(log2(i)) > floor(log2(i)) # max heap
            if H[floor(i/2)] < H[i]
                tmp = H[floor(i/2)]
                H[floor(i/2)] = H[i]
                H[i] = tmp
            end
        else # min heap
            if H[floor(i/2)] > H[i]
                tmp = H[floor(i/2)]
                h[floor(i/2)] = H[i]
                H[i] = tmp
            end
        end
    end

    return h
end


function insert(h)
    H = h["table"]
    N = h["size"]

    
