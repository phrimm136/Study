#lang sicp
(define (sum term a next b)
  (define (iter a result)
    (if (> a b) result (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube x) (* x x x))

(define (cube-sum a b)
  (sum cube a inc b))

(cube-sum 1 10)