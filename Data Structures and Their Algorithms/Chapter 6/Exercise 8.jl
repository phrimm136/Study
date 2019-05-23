#=

Q.

The Move-To-Front and Transpose Heuristics can be blended; for
example, we could devise a "Move-k-Forward" and a "Move-k%-
Forward" Heuristic. State exactly what these might be, and what
advantages or disadvantages they might have by comparison with the
simpler heuristic?

A.

Move-k-Forward Heuristic moves an element forward k times when the search is succeed.
Move-k%Forward Heuristic moves an element forward k% of the length of list times when the search is succeed.

Both heuristics are not too drastic nor stable with appropriate k,
but they can be easily affected by the length of the list, so if k is too small or large,
there is no difference between them and simpler heuristics.
Apart from that, we should get k of k% previous element after successful search and to do this in linked representation,
we should traverse again from the first, so they can be slower than the simpler heuristics.

=#
