#lang sicp
(define (iterative-improve good-enough? improve)
  (lambda (y)
    (define (repeat guess)
      (if (good-enough? guess) guess (repeat (improve guess))))
    (repeat y)))

(define (average x y)
  (/ (+ x y) 2))
(define (square x) (* x x))
(define (sqrt x)
  ((iterative-improve
    (lambda (guess) (< (abs (- (square guess) x)) 0.001))
    (lambda (y) (average y (/ x y))))
   1.0))

(sqrt 2)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (guess) (< (abs (- guess (f guess))) tolerance))
    f)
   first-guess))
(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))
(define (sqrt-average-damp x)
  (fixed-point-of-transform (lambda (y) (/ x y)) average-damp 1.0))

(sqrt-average-damp 2)