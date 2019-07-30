#lang sicp
(define (product term a next b)
  (if (> a b) 1 (* (term a) (product term (next a) next b))))
; recursive procedure

; (define (product term a next b)
;   (define (product-iter term a next b result)
;     (if (> a b) result (product-iter term (next a) next b (* result (term a)))))
;   (product-iter term a next b 1))
; iterative

(define (square x) (* x x))
(define (inc-two x) (+ x 2))

(define (f x) (/ (- (square x) 1) (square x)))

(define (calc-pi n)
  (* 4 (product f 3 inc-two n))) ; Start with odd number

(calc-pi 100)