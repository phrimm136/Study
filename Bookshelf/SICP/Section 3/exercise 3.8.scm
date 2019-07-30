#lang sicp
(define f
  (let ((x 2))
    (define (dispatch arg)
      (if (= x 0)
          x
          (begin (set! x arg) x)))
    dispatch))


; (f 1) - 1
; (f 0) - 0
; (f 1) - 0

(+ (f 0) (f 1)) ; 0, Racket ealuates arguments from left to right.