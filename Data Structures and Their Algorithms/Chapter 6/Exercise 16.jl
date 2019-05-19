#=

Q.

Using the table of ten numbers on page 186, use the interpolation search algorithm to find 93.

A.

-1 0  1  2  3   4   5   6   7   8   9   10
-1 11 72 93 260 316 431 788 798 903 910 1000


Initially left = 0, right = 9.

At first, p = (93 - (-1)) / (1000 - (-1)) = 0.09390, whence Middle = floor(0.09390(9-0+1))+0 = 0, which is too small, so Left = 1.

On the next, p = (93 - 0) / (1000 - 0) = 0.093, whence Middle = floor(0.093(9-1+1))+1 = 1, which is still small, so Left = 2.

Finally, p = (93 - 11) / (1000 - 11) = 0.08291, whence Middle = floor(0.08291(9-2+1))+2 = 2, and T[2] is the disired element.

So the index is 2.

=#
