#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (< n 1) (lambda (x) x) (compose f (repeated f (- n 1)))))

(define dx 0.1)
(define (smooth f)
  (lambda (x) (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)))
(define (n-fold-smooth f n)
  ((repeated smooth n) f))

((n-fold-smooth (lambda (x) (* x x)) 10) 7)