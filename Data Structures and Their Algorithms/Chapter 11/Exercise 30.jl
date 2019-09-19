#=

Q.

a. It takes n-1 comparisons to find the largest of n numbers. Why?

b. But it takes only ceil(3n/2)-2 comparisons to find both the largest
and smallest of n numbers. How can this be done?

c. Show that any comparison-based algorithm for finding both the
largest and the smallest of n items must make at least ceil(3n/2) - 2
comparisons in the worst case.

A.

a.

By swapping ith and (i+1)th element when A[i] > A[i+1] for 1..n-1
and taking the last element, we can find the largest of n numbers with
n-1 comparison.

b.

half the array until the length is not greater than 2.
Take min-max value of the minimum array and merge them adjecently.
Dividing and taking min-max value from the minimum arrays takes
ceil(n/2) comparisons, and mergind them takes 2(ceiling(n/2))-2 comparisons.
Thus, it takes ceiling(3/2n)-2 comparisons for finding min-max values.

c.

Since potente minimum and maximum value is n/2, getting those nominees
takes ceil(n/2) comparisions.
Also finding each winner needs ceil(n/2)-1 comparisons.
Therefore, the lower bound is ceil(3n/2)-2.

=#
