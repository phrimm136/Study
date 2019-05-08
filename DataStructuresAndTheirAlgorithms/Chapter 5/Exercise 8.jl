#=

Q.

Show how to represent multidimensional arrays with constant-time initialization and access.

A.

Set when and which data whose length is (j_1 - l_1) * ... * (j_d - l_1).
Because initialization is done when accessing an element, so we just need to show that accessing is done in constant-time.
To push a value in the array, we will subtract the address of data array from that of a given element with its indeces. Although integrating indeces takes O(n) time, it's not initialization or access function, so we can use this way.
With multidimensional-index from the previous sequence, get the element of the when array and assign the count, and assign the multidimensional-index to the where array.
When accessing, a multidimensional-index will be got from the given element and the where array, accessing the when element with it, and the rest sequences are equal to constant-time initialization with a linear array.

#=
