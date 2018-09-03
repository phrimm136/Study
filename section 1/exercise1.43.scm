#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (< n 1) (lambda (x) x) (compose f (repeated f (- n 1)))))

((repeated (lambda (y) (* y y)) 2) 5)