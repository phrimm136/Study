#=

Q.

Describe a set of n key values and a value to be soughthat will force
InterpolationSearchLookUp to iterate almost n times.

A.

=#

include("Exercise 17.jl") # Get the interpolation search function from the previous exercise.

T = [101, 102, 103, 104, 105, 106, 107, 108, 109, 110]
N = 1000
search_compare(T, T)

#=

101 => 1
102 => 2
103 => 3
104 => 4
105 => 5
106 => 6
107 => 7
108 => 8
109 => 9
110 => 10

if (K - key(T[left]-1))/(key(T[right+1])-T[left-1])*(right-left+1) = 0 for every element in a table,
the inerpolation seach algorithm is forced to iterate n times.

=#
