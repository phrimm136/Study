#lang sicp
(define (accumulate combiner null-value term a next b)
  (if (> a b) null-value (combiner (term a) (accumulate combiner null-value term (next a) next b))))
; recursive procedure

; (define (accumulate combiner null-value term a next b)
;   (define (accumulate-iter a result)
;     (if (> a b) result (accumulate-iter (next a) (combiner result (term a)))))
;   (accumulate-iter a null-value))
; iterative procedure

(define (inc n) (+ n 1))
(define (square x) (* x x))

(define (square-sum a b)
  (accumulate + 0 square a inc b))

(square-sum 1 10)