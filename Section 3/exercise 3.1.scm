#lang sicp
(define (make-accumulator initial-value)
  (define (sum augend)
    (set! initial-value (+ augend initial-value))
    initial-value)
  sum)

(define A (make-accumulator 5))

(A 10)
(A 10)