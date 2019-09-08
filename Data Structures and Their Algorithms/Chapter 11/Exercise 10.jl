#=

Q.

a. Show that Heap Sort is unstable.

b. Find a table A[O..3] such that Key(A[O]) = Key(A[1]) but the
relative order of these two elements in the sorted output produced
by Heap Sort depends on the value of one of the other elements
of the table.

A.

a.

If there are some elements whose key are same, then initializing
has no effect and the order of the table will be reversed.

b.

[3a 3b 4 5] => [3a 3b 4 5] => [4 3a 3b 5] => [4 3a 5 3b] =>  [5 3a 4 3b] => [3b] [5 4 3a] => [3b 3a 4 5]
[3a 3b 1 2] => [3a 3b 1 2] => [3a 3b 1 2] => [3a 3b 2 1] => [1 2 3b 3a]
[3a 3b 1 4] => [3a 3b 1 4] => [3a 3b 1 4] => [3a 3b 4 1] => [4 3b 3a 1] => [1 3a 3b 4]

If (Key[0]-Key[2]) * (Key[0]-Key[3]) < 0, a-b order,
otherwise, b-a order.

=#
