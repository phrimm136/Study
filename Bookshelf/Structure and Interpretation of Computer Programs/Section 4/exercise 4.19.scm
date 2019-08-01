#lang sicp
(let ((a 1))
  (define (f x)
    (define b (+ a x))
    (define a 5)
    (+ a b))
  (f 10))

; By imperative view, it's natural to evaluate/apply code top-down.
; But scheme is not imperative, so it's natural to make simultaneous scope in scheme.
; Eva's opinion could make priority problem (like concurrency problem), so it's reasonable to make an error.


; To implement internal definitions to behave as Eva prefers,
; we should check dependency of all definitions and make evaluation priority.