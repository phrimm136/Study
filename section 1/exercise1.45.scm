#lang sicp
(define (average x y)
  (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next) next (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (< n 1) (lambda (x) x) (compose f (repeated f (- n 1)))))

(define (fifth-roots x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y))))) 1.0))

(fifth-roots 32)

(define (log2 x)
  (/ (log x) (log 2)))
(define (root n x)
  (fixed-point ((repeated average-damp (floor (log2 n))) (lambda (y) (/ x (expt y (- n 1))))) 1.0))

(root 10 10000000000)