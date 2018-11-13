#lang sicp
; With memoization,

;(square (id 10))
; -> 100

; count
; -> 1


; With out memoization,

;(square (id 10))
; -> 100

; count
; -> 2


; With memoization, id is evaluated once and get the value from memoization, so count is 1.
; With out memoization, id is evaluated twice, so count is 2.
; Rebundant evaluation time wighout memoization is self-evident.