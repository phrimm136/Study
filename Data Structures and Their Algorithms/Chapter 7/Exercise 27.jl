#=

Q.

a. You are given a splay tree such that the path from the root to the
key 90 passes through the following keys in order: 10, 20, 30,
40, 50, 60, 70, 80, 90. Show the result of splaying 90 to the top.

b. You are given another tree such that the path to 90 passes through
50, 130, 60, 120, 70, 110, 80, 100. Show the result of splaying
90 to the top.

c. Assume that before the splaying operation, all the nodes of the
tree of part (a) on the path to 90 had rank k. Show that after
the splay operation of part (a) the ranks of these nodes do not
increase, and the ranks of at least three of them decrease.

d. Under the same hypothesis as in part (c), show that the splay
operation of part (b) causes no increase in ranks, and causes at
least four nodes to decrease in rank.

A.

a.

 10                                                                                90
   \                                                                              /
    20                                                                          20
      \                                                                        /  \
       30                                                                    10    40
         \                                                                        /  \
          40                                                                    30    60
            \                                                                        /  \
             50                             =>                                     50    80
               \                                                                        /
                60                                                                    70
                  \
                   70
                     \
                      80
                        \
                         90

b.

 50                                                                                              90
   \                                                                             /                                \
    130                                                                        50                                  130
   /                                                                             \                                /
 60                                                                               60                           120
   \                                                                                \                         /
    120                                                                              70                    110
   /                                                                                   \                  /
 70                                         =>                                          80             100
   \
    110
   /
 80
   \
    100
   /
 90

c.

The middle node of case 2 takes its parent as the left child instead of the right child, so 20, 40, 60, and 80 have no change.
