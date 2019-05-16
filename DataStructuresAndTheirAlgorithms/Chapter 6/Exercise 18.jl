#=

Q.

Using the same numbers as in Problem 17, perform an unsuccessful search for the number 500 using both binary and interpolation search.

A.

=#

include("Exercise 17.jl") # Include the functions and the variables from the previous exercise.

search_compare([100, 200, 300, 400, 500], T)

#=

         binary    interpolation
100      5         3
200      6         3
300      5         3
400      5         4
500      5         4

Interpolation search is better than binary search when search is unsuccessful.

=#

