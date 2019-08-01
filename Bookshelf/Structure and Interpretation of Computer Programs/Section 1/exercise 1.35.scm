#lang sicp
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? a b) (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess) guess (try next))))
  (try first-guess))

(define phi
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 2.0))

phi