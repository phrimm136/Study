#=

Q.

It may be possible to collapse two adjacent leaf pages of an extendible
hash table - say distinct pages pointed to by directory entries j and
j + 1 - even when these pages are not of maximal depth. Explain
exactly the conditions under which this is possible, and what should
be done.

A.

The sum of keys in adjacent pages should not exceed the maximum number of keys per a page.
The prefix number k and the k-1 prefix of two pages should be equal.
After collapsing, a union of the pages with preceeding prefix will be located.

=#
