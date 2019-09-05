#=

Q.

You are given n intervals l_i = [a_i, b_i] on the real line, where a_i < b_i
and 1 ≤ i ≤ n. Give an algorithm that computes the measure of this
set of intervals, that is, the total length of ∪(i=1, n)l_i, in O(nlogn) time.

A.

Using merge sort or quick sort to sort the set with regard of a_i,
merge the intervals if they are overlapped.
Sorting takes O(nlogn) and merging the intervals and calculating the length
takes O(n) time, so the total length is taken in O(nlogn) time.

=#
