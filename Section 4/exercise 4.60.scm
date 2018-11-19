#lang sicp
; Since ?person-1 and ?person-2 means ALL people in query, an overlapping result - combination of inputs - can satisfy the rule.
; To prevent these overlaps, we should memoize the results or sort and filter results.