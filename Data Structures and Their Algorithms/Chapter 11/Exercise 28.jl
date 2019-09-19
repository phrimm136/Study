#=

Q.

Show the decision tree that results from sorting a table of four unequal
elements using

a. Selection Sort (Algorithm 11.3);

b. Heap Sort (Algorithm 11.4);

c. Quick Sort (Algorithm 11.6).

A.

a.

                                                                                                       0:1
                                                    <                                                                                                           >
                                                   0:1                                                                                                         0:2
                            <                                               >                                                   <                                                       >
                           0:2                                             1:3                                                 1:3                                                     0:3
              <                        >                     <                            >                        <                           >                         <                             >
             0:3                      1:3                   0:3                          2:3                       0                          0:3                        0                            1:2
       <            >       <  >  < >                                                                           >
      1:2          2:3       0   0                                                                                1:3
   <       >                                                                                            >
  1:3     2:3                                                                                               2:3
 <   >   <   >
2:3 2:3 1:3
