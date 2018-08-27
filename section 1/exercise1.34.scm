#lang sicp
(define (f g)
  (g 2))

(define (square x) (* x x))

(f square)
(f (lambda (z) (* z (+ z 1))))
(f f) ; error

; (f f) -> (f 2) -> (2 2), which is not procedure